//
//  TableViewController.swift
//  RockTracks
//
//  Created by Anthony Marasia on 12/12/20.
//

import UIKit

class TableViewController: UITableViewController {
    
    var tracks : [Track] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        getTracks()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as! TrackTableViewCell
        let track = tracks[indexPath.row]

        cell.tackNameLabel.text = track.name
        cell.artistNameLabel.text = track.artist
        cell.priceLabel.text = getFormattedPrice(track: track)
        
        NetworkManager.getAlbumArt(url: track.artworkURL) { (imageData) in
            if let imageData = imageData {
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(data: imageData)
                    
                    //Fixes image not being displayed initially sometimes
                    if !cell.initialImageSet {
                        tableView.reloadRows(at: [indexPath], with: .none)
                        cell.initialImageSet = true
                    }
                }
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let track = tracks[indexPath.row]
        self.performSegue(withIdentifier: "showDetailVC", sender: track)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetailVC" {
            if let detailVC = segue.destination as? DetailViewController {
                if let track = sender as? Track {
                    detailVC.track = track
                }
            }
        }
    }
    
    // MARK: - My Functions
    
    func getTracks() {
        NetworkManager.getTrackSearchResults { (tracks) in
            if let tracks = tracks {
                self.tracks = tracks
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func getFormattedPrice(track :Track) -> String? {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        if let priceString = currencyFormatter.string(from: NSNumber(value: track.price)) {
            return priceString
        }
        return "\(track.price)"
    }

}
