//
//  LocalEventCategory.swift
//  Eventtly
//
//  Created by Karim Ebrahem on 6/10/19.
//  Copyright © 2019 Karim Ebrahem. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class LocalEventCategory: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    var events = List<LocalEvent>()
    
    convenience init(eventCategory: EventCategory) {
        self.init()
        self.id = eventCategory.id
        self.name = eventCategory.name
    }
    
}

extension LocalEventCategory {
    var eventCategory: EventCategory {
        return EventCategory(id: self.id, name: self.name)
    }
}
