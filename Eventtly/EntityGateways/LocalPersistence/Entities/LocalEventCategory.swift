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
    let events = List<LocalEvent>()
    
}
