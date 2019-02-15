//
//  Service.swift
//  AppStore
//
//  Created by Harry on 16/02/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import Foundation

class Service {
    static let shared = Service()
    
    func fetchApps(completion: @escaping ([Result], Error?) -> ()) {
        let urlSting = "http://itunes.apple.com/search?term=instagam&entity=software"
        guard let url = URL(string: urlSting) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("Failed to fetch apps:", err)
                completion([], nil)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                searchResult.results.forEach({print($0.trackName, $0.primaryGenreName)})
                completion(searchResult.results, nil)
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
                completion([], jsonErr)
            }
            
        }.resume()
    }
    
}
