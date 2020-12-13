//
//  Track.swift
//  RockTracks
//
//  Created by Anthony Marasia on 12/12/20.
//

import Foundation

class Track {
    let name: String
    let artist: String
    let price: Double
    let artworkURL: String
    let duration: Int
    let releaseDate: String
    let trackViewUrl: String
    let audioPreviewUrl: String
    
    init(name: String, artist: String, price: Double, artworkURL: String, duration: Int, releaseDate: String, trackViewUrl: String, audioPreviewUrl: String) {
        self.name = name
        self.artist = artist
        self.price = price
        self.artworkURL = artworkURL
        self.duration = duration
        self.releaseDate = releaseDate
        self.trackViewUrl = trackViewUrl
        self.audioPreviewUrl = audioPreviewUrl
    }
}
