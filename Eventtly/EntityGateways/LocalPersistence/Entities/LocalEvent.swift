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
    
}
