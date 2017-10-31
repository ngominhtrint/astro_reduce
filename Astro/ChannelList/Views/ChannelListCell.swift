//
//  ChannelListCell.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import UIKit
import AlamofireImage

class ChannelListCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    func set(forChannel channel: ChannelModel) {
        self.selectionStyle = .none
        nameLabel.text = channel.name
        numberLabel.text = channel.number
        if let url = URL(string: channel.logo) {
            logoImageView.af_setImage(withURL: url)
        }
    }
    
    @IBAction func onFavoriteAction(_ sender: Any) {
    
    }
}
