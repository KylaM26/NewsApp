//
//  DataService.swift
//  NewsFun
//
//  Created by Kyla Wilson on 6/5/19.
//  Copyright © 2019 Kyla Wilson. All rights reserved.
//

import Foundation
import DocumentClassifier

class DataService {
    
    static let instance = DataService()
    
    private(set) public var articles = [Article]()
    
    private init() {}
    
    func GetArticles(completion: @escaping (_ success: Bool) -> ()) {
        guard let url = URL(string: ARTICLES_URL) else { print("Invalid articles URL"); return }
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if response != nil {
                do {
                    if let data = data {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, Any> {
                                if let articles = json["articles"] as? Array<Dictionary<String, Any>> {
                                    for newsArticle in articles {
                                        guard let title = newsArticle["title"] as? String,
                                              let imageUrl = newsArticle["urlToImage"] as? String,
                                              let url = newsArticle["url"] as? String,
                                              let description = newsArticle["description"] as? String
                                        else { continue }
                                        
                                        guard let classification = DocumentClassifier().classify(description) else { return }
                                        let article = Article(title: title, imageURL: imageUrl, url: url, description: description, category: classification.prediction.category.rawValue)
                                        self.articles.append(article)
                                    }
                                    completion(true)
                                }
                            }
                        }
                    } catch {
                        print(error)
                        completion(false)
                    }
                }
            }
        session.resume()
    }
}
