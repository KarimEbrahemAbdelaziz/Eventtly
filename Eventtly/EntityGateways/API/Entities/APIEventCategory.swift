//
//  APIEventCategory.swift
//  Eventtly
//
//  Created by Karim Ebrahem on 6/10/19.
//  Copyright © 2019 Karim Ebrahem. All rights reserved.
//

import Foundation
import ObjectMapper

class APIEventCategory: Mappable {
    
    var id: String?
    var name: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
    
}

extension APIEventCategory {
    var eventCategory: EventCategory {
        return EventCategory(id: self.id ?? "", name: self.name ?? "")
    }
}
