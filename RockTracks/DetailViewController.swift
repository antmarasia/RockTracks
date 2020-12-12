//
//  DetailViewController.swift
//  RockTracks
//
//  Created by Anthony Marasia on 12/12/20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var albumArtImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackPriceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var moreDetailsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func moreDetailButtonPressed(_ sender: Any) {
        
    }
    
}
