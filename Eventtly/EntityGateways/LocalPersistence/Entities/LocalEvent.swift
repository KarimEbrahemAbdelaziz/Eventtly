//
//  LocalEvent.swift
//  Eventtly
//
//  Created by Karim Ebrahem on 6/10/19.
//  Copyright © 2019 Karim Ebrahem. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class LocalEvent: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var longitude: String = ""
    @objc dynamic var latitude: String = ""
    @objc dynamic var endDate: String = ""
    @objc dynamic var startDate: String = ""
    @objc dynamic var cover: String = ""
    
    convenience init(event: Event) {
        self.init()
        self.id = event.id
        self.name = event.name
        self.longitude = event.longitude
        self.latitude = event.latitude
        self.endDate = event.endDate
        self.startDate = event.startDate
        self.cover = event.cover
    }
    
}

extension LocalEvent {
    var event: Event {
        return Event(id: self.id, name: self.name, longitude: self.longitude, latitude: self.latitude, endDate: self.endDate, startDate: self.startDate, cover: self.cover)
    }
}
