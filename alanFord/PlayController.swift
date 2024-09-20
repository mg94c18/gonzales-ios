//
//  PlayController.swift
//  MasterDetailTest
//
//  Created by Stevanovic, Sasa on 9/10/24.
//  Copyright © 2024 Stevanovic, Sasa. All rights reserved.
//

import Foundation
import UIKit
import os.log

class PlayController: UIViewController {
    @IBAction func negativeButtonPressed(_ sender: Any) {
        if #available(iOS 10.0, *) {
            os_log("negativeButtonPressed")
        } else {
            // Fallback on earlier versions
        }
        dismiss(animated: true)
    }

    @IBAction func positiveButtonPressed(_ sender: Any) {
        if #available(iOS 10.0, *) {
            os_log("positiveButtonPressed")
        } else {
            // Fallback on earlier versions
        }
        guard let parent = parent as? DetailViewController else {
            dismiss(animated: true)
            return
        }

        guard let selected = tableView.indexPathsForSelectedRows else {
            // TODO: if nothing seleced, the button should be disabled
            // TODO: if nothing selected, the array may be empty; but the doc says "The value of this property is nil if there are no selected rows."
            if #available(iOS 10.0, *) {
                os_log("Nothing selected; we should not get here")
            } else {
                // Fallback on earlier versions
            }
            dismiss(animated: true)
            return
        }

        var tracks: [Int] = []
        tracks.reserveCapacity(selected.count)
        for select in selected {
            tracks.append(select.row)
        }

        parent.startPlayback(of: tracks)
    }
    
    @IBOutlet weak var tableView: UITableView!
}
