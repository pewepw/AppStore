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
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        let urlSting = "http://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        fetchGeneicJSONData(urlString: urlSting, completion: completion)
    }
    
    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/25/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) -> Void) {
        fetchGeneicJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGeneicJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGeneicJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            if let err = err {
                print("Failed to fetch games:", err)
                completion(nil, err)
                return
            }
            
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                completion(objects, nil)
            } catch {
                completion(nil, error)
                print("Failed to decode:", error)
            }
        }.resume()
    }
}

//MARK: - Without Generics

//class Service {
//    static let shared = Service()
//
//    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
//        let urlSting = "http://itunes.apple.com/search?term=\(searchTerm)&entity=software"
//        guard let url = URL(string: urlSting) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, err) in
//            if let err = err {
//                print("Failed to fetch apps:", err)
//                completion([], nil)
//                return
//            }
//
//            guard let data = data else { return }
//
//            do {
//                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
//                completion(searchResult.results, nil)
//            } catch let jsonErr {
//                print("Failed to decode json:", jsonErr)
//                completion([], jsonErr)
//            }
//
//            }.resume()
//    }
//
//    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
//        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/25/explicit.json"
//        fetchAppGroup(urlString: urlString, completion: completion)
//    }
//
//    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
//        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json"
//        fetchAppGroup(urlString: urlString, completion: completion)
//    }
//
//    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) -> Void) {
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, err) in
//            //            print(String(data: data!, encoding: .utf8))
//
//            if let err = err {
//                print("Failed to fetch games:", err)
//                completion(nil, err)
//                return
//            }
//
//            do {
//                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
//                //                appGroup.feed.results.forEach({print($0.name)})
//                completion(appGroup, nil)
//            } catch {
//                completion(nil, error)
//                print("Failed to decode:", error)
//            }
//            }.resume()
//    }
//
//    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
//        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, err) in
//
//            if let err = err {
//                print("Failed to fetch games:", err)
//                completion(nil, err)
//                return
//            }
//
//            do {
//                let objects = try JSONDecoder().decode([SocialApp].self, from: data!)
//                completion(objects, nil)
//            } catch {
//                completion(nil, error)
//                print("Failed to decode:", error)
//            }
//            }.resume()
//    }
//}
