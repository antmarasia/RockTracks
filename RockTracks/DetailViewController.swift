//
//  DetailViewController.swift
//  RockTracks
//
//  Created by Anthony Marasia on 12/12/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    var track: Track!

    @IBOutlet weak var albumArtImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackPriceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var moreDetailsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.trackNameLabel.text = track.name
        self.artistNameLabel.text = track.artist
        
        formatPrice()
        
        formatReleaseDate()
        
        formatDuration()
        
    }
    
    func formatPrice() {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        if let priceString = currencyFormatter.string(from: NSNumber(value: track.price)) {
            self.trackPriceLabel.text = priceString
        }
    }
    
    func formatReleaseDate() {
        //"releaseDate": "2011-01-24T08:00:00Z"
        // yyyy-MM-ddTHH:mm:ssZ
        
        let isoFormatter = ISO8601DateFormatter()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"

        if let date = isoFormatter.date(from: track.releaseDate) {
            self.releaseDateLabel.text = dateFormatter.string(from: date)
        }
    }
    
    func formatDuration() {
        let durationInSeconds = track.duration / 1000
        let seconds = durationInSeconds % 60
        let minutes = (durationInSeconds / 60) % 60
        self.durationLabel.text = String(format: "%0.2d:%0.2d",minutes,seconds)
    }
    
    @IBAction func moreDetailButtonPressed(_ sender: Any) {
        
    }
    
}
