//
//  Article.swift
//  NewsFun
//
//  Created by Kyla Wilson on 6/5/19.
//  Copyright © 2019 Kyla Wilson. All rights reserved.
//

import Foundation

class Article {
    private(set) public var title = String()
    private(set) public var imageURL = String()
    private(set) public var url = String()
    private(set) public var description = String()
    private(set) public var category = String()
    
    public init(title: String, imageURL: String, url: String, description: String, category: String) {
        self.title = title
        self.imageURL = imageURL
        self.url = url
        self.description = description
        self.category = category
    }
    
}
