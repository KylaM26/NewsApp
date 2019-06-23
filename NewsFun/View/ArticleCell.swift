//
//  ArticleCell.swift
//  NewsFun
//
//  Created by Kyla Wilson on 6/5/19.
//  Copyright © 2019 Kyla Wilson. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var categoryLbl: UILabel!
    
    func Configure(title: String, category: String, imageURL: String) {
        self.titleLbl.text = title
        self.categoryLbl.text = category
        let url = URL(string: imageURL)
        self.imgView.kf.setImage(with: url)
    }

}
