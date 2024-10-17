//
//  PlayController.swift
//  MasterDetailTest
//
//  Created by Stevanovic, Sasa on 9/10/24.
//  Copyright © 2024 Stevanovic, Sasa. All rights reserved.
//

import Foundation
import UIKit

class PlayController: UIViewController, UITableViewDataSource {
    @IBAction func negativeButtonPressed(_ sender: Any) {
        AppDelegate.log("negativeButtonPressed")
        dismiss(animated: true)
    }
    
    @IBAction func positiveButtonPressed(_ sender: Any) {
        AppDelegate.log("positiveButtonPressed")
        guard let parent = detailViewController else {
            dismiss(animated: true)
            return
        }
        
        guard let selected = tableView.indexPathsForSelectedRows else {
            // TODO: if nothing selected, the button should be disabled
            // TODO: if nothing selected, the array may be empty; but the doc says "The value of this property is nil if there are no selected rows."
            AppDelegate.log("Nothing selected; we should not get here")
            dismiss(animated: true)
            return
        }
        
        var tracks: [Int] = []
        tracks.reserveCapacity(selected.count)
        for select in selected {
            tracks.append(idsToShow![select.row])
        }
        parent.startPlayback(of: tracks.sorted())
    }
    
    @IBOutlet weak var tableView: UITableView!

    weak var detailViewController: DetailViewController?
    var idsToShow: [Int]?

    func configure(_ idsToShow: [Int], _ detailViewController : DetailViewController ) {
        self.idsToShow = idsToShow
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        self.detailViewController = detailViewController
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return idsToShow!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayCell", for: indexPath)

        var title = "\(idsToShow![indexPath.row] + 1). \(Assets.titles[idsToShow![indexPath.row]])"
        cell.textLabel!.text = title

        return cell
    }

}
