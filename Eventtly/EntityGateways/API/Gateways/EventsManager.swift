//
//  EventsManager.swift
//  Eventtly
//
//  Created by Karim Ebrahem on 6/10/19.
//  Copyright © 2019 Karim Ebrahem. All rights reserved.
//

import Alamofire
import Foundation
import ObjectMapper

class EventsManager {
    
    enum EventsManagerError: Error {
        case parseFailed
        case networkError
    }
    
    static func fetchEventsCategories(_ completionHandler: @escaping (Result<[APIEventCategory], EventsManagerError>) -> Void) {
        let request = EventsRouter.fetchEventsCategories
        
        AF.request(request).responseJSON { response in
            switch response.result {
            case let .success(value):
                guard let jsonArray = value as? [[String: Any]] else {
                    completionHandler(.failure(EventsManagerError.parseFailed))
                    return
                }
                let eventsCategories: [APIEventCategory] = Mapper<APIEventCategory>().mapArray(JSONArray: jsonArray)
                completionHandler(.success(eventsCategories))
            case .failure:
                completionHandler(.failure(EventsManagerError.networkError))
            }
        }
    }
    
    static func fetchEvents(ofType type: String, atPage page: String, _ completionHandler: @escaping (Result<[APIEvent], EventsManagerError>) -> Void) {
        let request = EventsRouter.fetchEvents(eventType: type, page: page)
        
        AF.request(request).responseJSON { response in
            switch response.result {
            case let .success(value):
                guard let jsonArray = value as? [[String: Any]] else {
                    completionHandler(.failure(EventsManagerError.parseFailed))
                    return
                }
                let events: [APIEvent] = Mapper<APIEvent>().mapArray(JSONArray: jsonArray)
                completionHandler(.success(events))
            case .failure:
                completionHandler(.failure(EventsManagerError.networkError))
            }
        }
    }
    
}
