//
//  DataService.swift
//  NewsFun
//
//  Created by Kyla Wilson on 6/5/19.
//  Copyright © 2019 Kyla Wilson. All rights reserved.
//

import Foundation

class DataService {
    
    static let instance = DataService()
    
    private init() {
        
    }
    
    func GetArticles() {
        guard let url = URL(string: ARTICLES_URL) else { print("Invalid articles URL"); return }
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if response != nil {
                do {
                    if let data = data {
                        let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                        print(jsonData)
                    }
                } catch {
                    print(error)
                }
            }
        }
        session.resume()
    }
}
