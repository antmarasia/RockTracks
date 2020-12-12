//
//  NetworkManager.swift
//  RockTracks
//
//  Created by Anthony Marasia on 12/12/20.
//

import Foundation

class NetworkManager {
    
    static func getTrackSearchResults(completion:( @escaping (_ tracks: [Track]?) -> Void)) {
        var request = URLRequest(url: URL(string: "https://itunes.apple.com/search?term=rock&media=music")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                completion(nil)
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let results = json["results"] as? Array<Dictionary<String,Any>> {
                        var tracks : [Track] = []
                        
                        for result in results {
                            
                            //Pull out the date we need
                            let name = result["trackName"] as? String
                            let artist = result["artistName"] as? String
                            let price = result["trackPrice"] as? Double
                            let artworkURL = result["artworkUrl100"] as? String
                            let duration = result["trackTimeMillis"] as? Int
                            let releaseDate = result["releaseDate"] as? String
                            let trackViewUrl = result["trackViewUrl"] as? String
                            
                            if let name = name, let artist = artist, let price = price, let artworkURL = artworkURL, let duration = duration, let releaseDate = releaseDate, let trackViewUrl = trackViewUrl {
                                let track = Track(name: name, artist: artist, price: price, artworkURL: artworkURL, duration: duration, releaseDate: releaseDate, trackViewUrl: trackViewUrl)
                                tracks.append(track)
                            }
                            
                        }
                        completion(tracks)
                    }
                }
            } catch let jsonParseError {
                print(jsonParseError.localizedDescription)
                completion(nil)
            }
            
        }
        
        task.resume()
    }
    
    static func getAlbumArt(url: String, completion:( @escaping (_ imageData: Data?) -> Void)) {
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                completion(nil)
                return
            }
            completion(data)
        }
        
        task.resume()
    }
}
