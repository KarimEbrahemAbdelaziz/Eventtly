//
//  CacheEventsGateway.swift
//  Eventtly
//
//  Created by Karim Ebrahem on 6/10/19.
//  Copyright © 2019 Karim Ebrahem. All rights reserved.
//

import Foundation

class CacheEventsGateway: EventsGateway {
    
    let apiEventsGateway: APIEventGateway
    let localPersistenceEventsGateway: LocalPersistenceEventsGateway
    
    init(apiEventsGateway: APIEventGateway, localPersistenceEventsGateway: LocalPersistenceEventsGateway) {
        self.apiEventsGateway = apiEventsGateway
        self.localPersistenceEventsGateway = localPersistenceEventsGateway
    }
    
    func fetchCategories(completionHandler: @escaping FetchEventsCategoriesEntityGatewayCompletionHandler) {
        apiEventsGateway.fetchCategories { result in
            self.handleFetchCategoriesApiResult(result, completionHandler: completionHandler)
        }
    }
    
    func fetchEvents(ofType type: String, atPage page: String, completionHandler: @escaping FetchEventsEntityGatewayCompletionHandler) {
        apiEventsGateway.fetchEvents(ofType: type, atPage: page) { result in
            self.handleFetchEventsApiResult(type: type, result, completionHandler: completionHandler)
        }
    }
    
    // MARK: - Private
    
    fileprivate func handleFetchCategoriesApiResult(_ result: Result<[EventCategory], Error>, completionHandler: @escaping (Result<[EventCategory], Error>) -> Void) {
        switch result {
        case let .success(cateogries):
            localPersistenceEventsGateway.saveCategories(categories: cateogries)
            completionHandler(result)
        case .failure:
            localPersistenceEventsGateway.fetchCategories(completionHandler: completionHandler)
        }
    }
    
    fileprivate func handleFetchEventsApiResult(type: String, _ result: Result<[Event], Error>, completionHandler: @escaping (Result<[Event], Error>) -> Void) {
        switch result {
        case let .success(events):
            localPersistenceEventsGateway.saveEvents(categoryType: type, events: events)
            completionHandler(result)
        case .failure:
            localPersistenceEventsGateway.fetchEvents(ofType: type, atPage: "1", completionHandler: completionHandler)
        }
    }

}
