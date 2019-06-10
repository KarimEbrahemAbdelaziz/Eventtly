//
//  LocalEventsGateway.swift
//  Eventtly
//
//  Created by Karim Ebrahem on 6/10/19.
//  Copyright © 2019 Karim Ebrahem. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

protocol LocalPersistenceEventsGateway: EventsGateway {
    func saveCategories(categories: [EventCategory])
    func saveEvents(categoryType: String, events: [Event])
}

class RealmEventsGateway: LocalPersistenceEventsGateway {
    
    enum RealmEventsGatewayError: Error {
        case noEventForThisCategory
    }
    
    func saveEvents(categoryType: String, events: [Event]) {
        let category = EventsRealmManager.restoreCategoriy(with: categoryType)
        guard let nonOptionalCategory = category else {
            return
        }
        
        let localEvents = List<LocalEvent>()
        events.forEach { event in
            let localEvent = LocalEvent(event: event)
            localEvents.append(localEvent)
        }
        
        nonOptionalCategory.events = localEvents
        
        EventsRealmManager.saveCategory(objects: nonOptionalCategory)
    }
    
    func saveCategories(categories: [EventCategory]) {
        categories.forEach { eventCategory in
            let localCategory = LocalEventCategory(eventCategory: eventCategory)
            EventsRealmManager.saveCategory(objects: localCategory)
        }
    }
    
    func fetchCategories(completionHandler: @escaping FetchEventsCategoriesEntityGatewayCompletionHandler) {
        let localCategories = EventsRealmManager.restoreAllCategories()
        let categories: [EventCategory] = localCategories.map { localEventCategory -> EventCategory in
            return localEventCategory.eventCategory
        }
        
        completionHandler(.success(categories))
    }
    
    func fetchEvents(ofType type: String, atPage page: String, completionHandler: @escaping FetchEventsEntityGatewayCompletionHandler) {
        
        let localCategory = EventsRealmManager.restoreCategoriy(with: type)
        var events = [Event]()
  
        localCategory?.events.forEach({ localEvent in
            events.append(localEvent.event)
        })
        
        completionHandler(.success(events))
    }
    
}
