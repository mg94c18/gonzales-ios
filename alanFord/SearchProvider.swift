//
//  SearchProvider.swift
//  MasterDetailTest
//
//  Created by Korisnik on 10/21/24.
//  Copyright © 2024 Stevanovic, Sasa. All rights reserved.
//

import Foundation

// ../Gonzales/app/src/main/java/org/mg94c18/gonzales/SearchProvider.java
class SearchProvider {
    private let MINIMUM_RESULTS = 16
    private let WORD_EPISODE_SEPARATOR = "/"

    struct Position: Hashable {
        let title: String
        let episodeId: Int
        let word: String

        public var hashValue: Int {
            return "\(title)\(episodeId)\(word)".hashValue
        }
    }

    struct Node: Hashable {
        var children: [String : Node]
        var results: [String : Set<Position>]
        var similars: Set<Node>
        var transitiveSimilarsResolved: Bool
        var treePath: String

        public var hashValue: Int {
            return treePath.hashValue
        }
    }

    private var trie: Node? = nil
    private var threadKickedOff: Bool = false
    private var lastNode: Node? = nil
    private var lastMatchedQuery: String = ""
    private var nodeStack: [(Node, String)] = []
    private var splitChars = "[] .,!?|¡¿:;\"()'-_{}" // .split() not available
    private var htmlTags = try! NSRegularExpression(pattern: "(<[^>]+>)|(\\{[^\\{\\}]+\\})")
    private var hintsPattern = OnePageController.hintsPattern

    func populateTrie(numbers: [String], titles: [String]) {
        if trie != nil {
            AppDelegate.log("Already populated")
            return
        }
        if threadKickedOff {
            AppDelegate.log("Already attempted to populate")
            return
        }
        threadKickedOff = true
        DispatchQueue.global(qos: .userInitiated).async {
            self.populateTrieBlocking(numbers: numbers, titles: titles)
        }
    }

    func query(_ query: String) -> [(Int, String)] {
        let query = query.lowercased()
        var cursor = [(Int, String)]()

        if query.isEmpty {
            return cursor
        }

        var searchFrom: Node?
        var searchWhat: String?
        if query.starts(with: lastMatchedQuery) && lastNode != nil {
            searchFrom = lastNode
            searchWhat = mySubstring(query, lastMatchedQuery.count)
        } else if lastMatchedQuery.starts(with: query) {
            while !nodeStack.isEmpty {
                if query.starts(with: nodeStack[0].1) {
                    break
                }
                nodeStack.removeFirst()
            }
            if nodeStack.isEmpty {
                searchFrom = trie
                searchWhat = query
                lastNode = nil
                lastMatchedQuery = ""
                nodeStack.removeAll()
            } else {
                let lastMatch = nodeStack[0]
                lastNode = lastMatch.0
                lastMatchedQuery = lastMatch.1
                searchFrom = lastNode
                searchWhat = mySubstring(query, lastMatchedQuery.count)
            }
        } else {
            searchFrom = trie
            searchWhat = query
            lastNode = nil
            lastMatchedQuery = ""
            nodeStack.removeAll()
        }
        var positionsAdded = Set<Position>()
        trieQuery(query, searchWhat!, &searchFrom, &cursor, &positionsAdded)
        return cursor
    }

    func ready() -> Bool {
        return trie != nil
    }

    private func trieQuery(_ fullQuery: String, _ query: String, _ node: inout Node?, _ cursor: inout [(Int, String)], _ positionsAdded: inout Set<Position>) -> Int {
        var resultCount = 0
        if node == nil {
            return resultCount
        }
        if query.isEmpty {
            if lastNode != node {
                lastNode = node
                lastMatchedQuery = fullQuery
                nodeStack.append((node!, lastMatchedQuery))
            }
            resultCount += addThisNode(&node!, &cursor, &positionsAdded)
        } else {
            let first = akaFor(query.substring(to: query.index(query.startIndex, offsetBy: 1)))
            let rest = mySubstring(query, 1)
            var child = node!.children[first]
            resultCount += trieQuery(fullQuery, rest, &child, &cursor, &positionsAdded)
        }
        var fillUpNodes = [Node]()
        fillUpNodes.append(node!)

        while !fillUpNodes.isEmpty && resultCount < MINIMUM_RESULTS {
            var fillUpNode = fillUpNodes.removeFirst()
            resultCount += addThisNode(&fillUpNode, &cursor, &positionsAdded)
            for entry in fillUpNode.children {
                fillUpNodes.append(entry.value)
            }
        }
        return resultCount
    }

    private func addThisNode(_ node: inout Node, _ cursor: inout [(Int, String)], _ positionsAdded: inout Set<Position>) -> Int {
        var resultCount = 0
        if !node.transitiveSimilarsResolved {
            var transitiveSimilars = Set<Node>()
            transitiveSimilars.insert(node)
            findTransitiveSimilars(&transitiveSimilars, &node)

            for var transitiveSimilar in transitiveSimilars {
                transitiveSimilar.similars = Set<Node>()
                // addAll+remove
                for theOther in transitiveSimilars {
                    if theOther != transitiveSimilar {
                        transitiveSimilar.similars.insert(theOther)
                    }
                }
                transitiveSimilar.transitiveSimilarsResolved = true
            }
        }
        resultCount += addThisNodeOnly(node, &cursor, &positionsAdded)
        for similar in node.similars {
            resultCount += addThisNodeOnly(similar, &cursor, &positionsAdded)
        }
        return resultCount
    }

    private func addThisNodeOnly(_ node: Node, _ cursor: inout [(Int, String)], _ positionsAdded: inout Set<Position>) -> Int {
        var resultCount = 0
        for entry in node.results {
            let positions = entry.value

            for position in positions {
                if positionsAdded.contains(position) {
                    continue
                }

                cursor.append((position.episodeId, position.word))
                positionsAdded.insert(position)
                resultCount += 1
            }
        }
        return resultCount
    }

    private func findTransitiveSimilars(_ result: inout Set<Node>, _ node: inout Node) {
        for var similar in node.similars {
            let inserted = result.insert(similar)
            if inserted.inserted {
                findTransitiveSimilars(&result, &similar)
            }
        }
    }

    private func populateTrieBlocking(numbers: [String], titles: [String]) {
        if titles.count != numbers.count {
            AppDelegate.log("WTF Inconsistent arrays")
            return
        }
        var newTrie = Node(children: [:], results: [:], similars: [], transitiveSimilarsResolved: false, treePath: "")
        var lines: [String] = []
        for i in stride(from: 0, to: titles.count, by: 1) {
            lines = Assets.pages(forEpisode: i)
            if numbers[i] == "abvgd" {
                continue
            }
            for j in stride(from: 2, to: lines.count, by: 1) {
                var line = htmlTags.stringByReplacingMatches(in: lines[j], range: NSMakeRange(0, lines[j].count), withTemplate: "").lowercased()
                line = hintsPattern.stringByReplacingMatches(in: line, range: NSMakeRange(0, line.count), withTemplate: "")
                let words: [String] = mySplit(separators: splitChars, line: line)
                for word in words {
                    let position = Position(title: titles[i], episodeId: i, word: word)
                    insertWord(&newTrie, word, word, word, position)
                }
            }
        }
        DispatchQueue.main.async {
            self.trie = newTrie
        }
    }

    private let skrati1 = ["je"]
    private let skrati2 = ["ije"]
    private let skrati3 = ["tko", "gde", "psova", "znači"]

    private func insertWord(_ node: inout Node, _ origWord: String, _ finalWord: String, _ downPath: String, _ position: Position) -> Node {
        if downPath.isEmpty {
            if node.results[finalWord] == nil {
                node.results[finalWord] = Set<Position>()
            }
            if node.treePath.isEmpty && !origWord.isEmpty {
                node.treePath = origWord
                for var similar in node.similars {
                    similar.similars.insert(node)
                }
            }
            node.results[finalWord]!.insert(position)
            return node
        }
        let first = akaFor(downPath.substring(to: downPath.index(downPath.startIndex, offsetBy: 1)))
        let rest = mySubstring(downPath, 1)

        if node.children[first] == nil {
            let child = Node(children: [:], results: [:], similars: [], transitiveSimilarsResolved: false, treePath: "")
            node.children[first] = child
        }
        var leaf = insertWord(&node.children[first]!, origWord, finalWord, rest, position)

        if !origWord.isEmpty {
            for s in skrati1 {
                if moreThan(rest, s) {
                    var jeka = insertWord(&node.children[first]!, "", finalWord, mySubstring(rest, 1), position)
                    applyShallowSimilarity(&jeka, &leaf)
                }
            }
            for s in skrati2 {
                if moreThan(rest, s) {
                    for i in stride(from: 1, through: 2, by: 1) {
                        var jeka = insertWord(&node.children[first]!, "", finalWord, mySubstring(rest, i), position)
                        applyShallowSimilarity(&jeka, &leaf)
                    }
                }
            }
            for s in skrati3 {
                if downPath.starts(with: s) {
                    var jeka = insertWord(&node, "", finalWord, mySubstring(downPath, 1), position)
                    applyShallowSimilarity(&jeka, &leaf)
                }
            }
        }
        return leaf
    }

    private let akasMap = [
        ["c", "č", "ć"] : "c",
        ["s", "š"] : "s",
        ["d", "đ"] : "d",
        ["z", "ž"] : "z",
        ["a", "á", "ȁ", "â"] : "a",
        ["e", "ȅ", "è", "é", "ê"] : "e",
        ["i", "ȉ","í"] : "i",
        ["o", "ȍ", "ò", "ó"] : "o",
        ["u", "ȕ", "ú", "ü"] : "u",
        ["n", "ñ"] : "n",
    ]
    private func akaFor(_ letter: String) -> String {
        for aka in akasMap {
            if aka.key.contains(letter) {
                return aka.value
            }
        }
        return letter
    }

    private func mySplit(separators: String, line: String) -> [String] {
        var words: [String] = []
        var index: String.Index? = nil
        var line = line
        repeat {
            index = line.firstIndex { (ch) -> Bool in
                return separators.contains(ch)
            }
            if index == nil {
                if !line.isEmpty {
                    words.append(line)
                }
            } else {
                let next = line.substring(to: index!)
                line.removeFirst(next.count + 1)
                if !next.isEmpty {
                    words.append(next)
                }
            }
        } while index != nil
        return words
    }

    private func mySubstring(_ s: String, _ i: Int) -> String {
        return s.substring(from: s.index(s.startIndex, offsetBy: i))
    }

    private func moreThan(_ s1: String, _ s2: String) -> Bool {
        return s1.count > s2.count && s1.starts(with: s2)
    }

    private func applyShallowSimilarity(_ node: inout Node, _ similar: inout Node) {
        if similar.treePath.isEmpty {
            AppDelegate.log("WTF - unexpected similarity")
            return
        }
        node.similars.insert(similar)
        if !node.treePath.isEmpty {
            similar.similars.insert(node)
        }
    }
}
