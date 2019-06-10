//
//  APIEventGateway.swift
//  Eventtly
//
//  Created by Karim Ebrahem on 6/10/19.
//  Copyright © 2019 Karim Ebrahem. All rights reserved.
//

import Foundation

protocol APIEventGateway: EventsGateway {
    
}

class APIEventGatewayImplementation: APIEventGateway {
    func fetchCategories(completionHandler: @escaping FetchEventsCategoriesEntityGatewayCompletionHandler) {
        EventsManager.fetchEventsCategories { (result: Result<[APIEventCategory], EventsManager.EventsManagerError>) in
            switch result {
            case let .success(response):
                let categories = response.map({ apiEventCategory -> EventCategory in
                    return apiEventCategory.eventCategory
                })
                completionHandler(.success(categories))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func fetchEvents(ofType type: String, atPage page: String, completionHandler: @escaping FetchEventsEntityGatewayCompletionHandler) {
        EventsManager.fetchEvents(ofType: type, atPage: page) { (result: Result<[APIEvent], EventsManager.EventsManagerError>) in
            switch result {
            case let .success(response):
                let events = response.map({ apiEvent -> Event in
                    return apiEvent.event
                })
                completionHandler(.success(events))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
