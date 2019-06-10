//
//  EventsGateway.swift
//  Eventtly
//
//  Created by Karim Ebrahem on 6/10/19.
//  Copyright © 2019 Karim Ebrahem. All rights reserved.
//

import Foundation

typealias FetchEventsCategoriesEntityGatewayCompletionHandler = (_ categories: Result<[EventCategory], Error>) -> Void
typealias FetchEventsEntityGatewayCompletionHandler = (_ categories: Result<[Event], Error>) -> Void

protocol EventsGateway {
    func fetchCategories(completionHandler: @escaping FetchEventsCategoriesEntityGatewayCompletionHandler)
    func fetchEvents(ofType type: String, atPage page: String, completionHandler: @escaping FetchEventsEntityGatewayCompletionHandler)
}
