//
//  EventsRealmManager.swift
//  Eventtly
//
//  Created by Karim Ebrahem on 6/10/19.
//  Copyright © 2019 Karim Ebrahem. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class EventsRealmManager {
    
    private static let realm = try! Realm(configuration: RealmConfiguration.main.configuration)
    
    static func restoreAllCategories() -> Results<LocalEventCategory> {
        let objects = realm.objects(LocalEventCategory.self)
        return objects
    }
    
    static func restoreCategoriy(with id: String) -> LocalEventCategory? {
        let category = realm.object(ofType: LocalEventCategory.self, forPrimaryKey: id)
        return category
    }
    
    static func restoreEventsForCategoryId(id: String) -> List<LocalEvent> {
        guard let category = restoreCategoriy(with: id) else {
            return List<LocalEvent>()
        }
        
        return category.events
    }
    
    static func saveCategory(objects: LocalEventCategory) {
        try? realm.write {
            realm.add(objects, update: true)
        }
    }
    
    static func deleteAll() {
        try? realm.write {
            realm.deleteAll()
        }
    }
    
}
