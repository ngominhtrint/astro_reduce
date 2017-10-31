//
//  GuideChannelGridCell.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import UIKit
import G3GridView

class GuideChannelGridCell: GridViewCell {

    @IBOutlet weak var channelLabel: UILabel!
    
    static var nib: UINib {
        return UINib(nibName: "GuideChannelGridCell", bundle: Bundle(for: self))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        channelLabel.font = .boldSystemFont(ofSize: 16)
        channelLabel.textColor = .lightGray
        channelLabel.textAlignment = .center
    }
    
    func configure(_ channelName: String) {
        channelLabel.text = channelName
    }
}
