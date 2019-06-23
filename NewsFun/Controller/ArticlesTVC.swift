//
//  ArticlesTVC.swift
//  NewsFun
//
//  Created by Kyla Wilson on 6/5/19.
//  Copyright © 2019 Kyla Wilson. All rights reserved.
//

import UIKit

class ArticlesTVC: UITableViewController {

    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = String("Loading Articles")
        DataService.instance.GetArticles { (newsArticles) in
            self.articles.append(contentsOf: newsArticles)
            self.title = String("News Fun")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }

        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell {
            let article = articles[indexPath.row]
            cell.Configure(title: article.title, category: article.category, imageURL: article.imageURL)
            return cell
        }
        return ArticleCell()
    }
}
