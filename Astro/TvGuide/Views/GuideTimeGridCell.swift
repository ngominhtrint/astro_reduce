//
//  GuideTimeGridCell.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import UIKit
import G3GridView

class GuideTimeGridCell: GridViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    static var nib: UINib {
        return UINib(nibName: "GuideTimeGridCell", bundle: Bundle(for: self))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        timeLabel.font = .boldSystemFont(ofSize: 14)
        timeLabel.textColor = .white
        timeLabel.numberOfLines = 1
        timeLabel.textAlignment = .center
        
        borderView.backgroundColor = .white
    }
    
    func configure(_ hour: Int) {
        timeLabel.text = "\(hour)"
    }
}
