//
//  Post.swift
//  Networking
//
//  Created by Артем Галай on 23.10.22.
//

import Foundation

class Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
