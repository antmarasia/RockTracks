//
//  TrackTableViewCell.swift
//  RockTracks
//
//  Created by Anthony Marasia on 12/12/20.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    
    @IBOutlet weak var albumArtImageView: UIImageView!
    @IBOutlet weak var tackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var initialImageSet = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
