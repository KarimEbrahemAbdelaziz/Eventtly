//
//  DisplayEvents.swift
//  Eventtly
//
//  Created by Karim Ebrahem on 6/10/19.
//  Copyright © 2019 Karim Ebrahem. All rights reserved.
//

import Foundation

typealias DisplayEventsUseCaseCompletionHandler = (_ movies: Result<[Event], Error>) -> Void
typealias DisplayEventsCategoriesUseCaseCompletionHandler = (_ movies: Result<[EventCategory], Error>) -> Void

protocol DisplayEventsUseCase {
    func displayEventsCategories(completionHandler: @escaping DisplayEventsCategoriesUseCaseCompletionHandler)
    func displayEvents(completionHandler: @escaping DisplayEventsUseCaseCompletionHandler)
}

class DisplayEventsUseCaseImplementation: DisplayEventsUseCase {
    let eventsGateway: EventsGateway
    
    init(eventsGateway: EventsGateway) {
        self.eventsGateway = eventsGateway
    }
    
    // MARK: - DisplayEventsUseCase
    
    func displayEventsCategories(completionHandler: @escaping DisplayEventsCategoriesUseCaseCompletionHandler) {
        self.eventsGateway.fetchCategories { result in
            completionHandler(result)
        }
    }
    
    func displayEvents(completionHandler: @escaping DisplayEventsUseCaseCompletionHandler) {
        self.eventsGateway.fetchEventDetails { result in
            completionHandler(result)
        }
    }

}
