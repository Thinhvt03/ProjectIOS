//
//  StoryCell.swift
//  API REST
//
//  Created by Hoàng Loan on 26/12/2022.
//

import UIKit

class StoryCell: UITableViewCell {

    @IBOutlet weak var thumbnailView: UIImageView!
        @IBOutlet weak var headlineLabel: UILabel!

        var story: Story? {
            didSet {
                headlineLabel?.text = story?.headline
                headlineLabel?.sizeToFit()
            }
        }
}

