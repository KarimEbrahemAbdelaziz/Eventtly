//
//  APIEvent.swift
//  Eventtly
//
//  Created by Karim Ebrahem on 6/10/19.
//  Copyright © 2019 Karim Ebrahem. All rights reserved.
//

import Foundation
import ObjectMapper

class APIEvent: Mappable {
    
    var id: String?
    var name: String?
    var longitude: String?
    var latitude: String?
    var endDate: String?
    var startDate: String?
    var cover: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        longitude <- map["longitude"]
        latitude <- map["latitude"]
        endDate <- map["end_date"]
        startDate <- map["start_date"]
        cover <- map["cover"]
    }
    
}

extension APIEvent {
    var event: Event {
        return Event(id: self.id ?? "", name: self.name ?? "", longitude: self.longitude ?? "", latitude: self.latitude ?? "", endDate: self.endDate ?? "", startDate: self.startDate ?? "", cover: self.cover ?? "")
    }
}
