//
//  EventsRouter.swift
//  Eventtly
//
//  Created by Karim Ebrahem on 6/10/19.
//  Copyright © 2019 Karim Ebrahem. All rights reserved.
//

//swiftlint:disable all
import Alamofire
import Foundation

enum EventsRouter: URLRequestConvertible {
    
    static let baseURLString = "http://private-7466b-eventtuschanllengeapis.apiary-mock.com"
    
    case fetchEventsCategories
    case fetchEvents(eventType: String, page: String)
    
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .fetchEventsCategories, .fetchEvents:
                return .get
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case .fetchEventsCategories, .fetchEvents:
                return nil
            }
        }()
        
        let url: URL = {
            // build up and return the URL for each endpoint
            let relativePath: String?
            switch self {
            case .fetchEventsCategories:
                relativePath = EventsRouter.baseURLString + "/eventtypes"
            case .fetchEvents:
                relativePath = EventsRouter.baseURLString + "/events"
            }
            
            var url: URL!
            if let relativePath = relativePath {
                switch self {
                case let .fetchEvents(eventType, page):
                    
                    let queryItems = [URLQueryItem(name: "text", value: relativePath)]
                    var urlComps = URLComponents(string: relativePath)!
                    urlComps.queryItems = queryItems
                    url = try! urlComps.asURL()
                    url = url.appending("page", value: page)
                    url = url.appending("event_type", value: eventType)
                case .fetchEventsCategories:
                    break
                }
            }
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding: ParameterEncoding = {
            return JSONEncoding.default
        }()
        return try! encoding.encode(urlRequest, with: params)
    }
}
//swiftlint:enable all
