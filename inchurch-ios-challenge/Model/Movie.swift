//
//  Movie.swift
//  inchurch-ios-challenge
//
//  Created by matela on 08/04/20.
//  Copyright © 2020 José Matela Neto. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Movie: Object, Mappable {
    var id = RealmOptional<Int>()
    @objc dynamic var title: String?
    @objc dynamic var overview: String?
    @objc dynamic var image: String?
    @objc dynamic var releaseDate: String?
    var favorite = RealmOptional<Bool>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        self.id.value             <- map["id"]
        self.title                <- map["title"]
        self.overview             <- map["overview"]
        self.image                <- map["poster_path"]
        self.releaseDate          <- map["release_date"]
        self.favorite.value        = false
    }
}
