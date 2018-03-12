//
//  profileObject.swift
//  Yang_WU_Lab4
//
//  Created by yang on 2017/10/22.
//  Copyright © 2017年 yang. All rights reserved.
//

import Foundation
import UIKit
//object for each movie
struct Profile{
    var title: String!
    var url: String!
    var rating: Double!
    var id: String!
    var release: String!
}

private let reuseIdentifier = "mycell"


class customizedCell: UICollectionViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    
    
    
}


