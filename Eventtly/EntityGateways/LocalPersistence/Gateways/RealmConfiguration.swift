//
//  RealmConfiguration.swift
//  Eventtly
//
//  Created by Karim Ebrahem on 6/10/19.
//  Copyright © 2019 Karim Ebrahem. All rights reserved.
//

import Foundation
import RealmSwift

enum RealmConfiguration {
    
    // MARK: - private configurations
    private static let mainConfig = Realm.Configuration.defaultConfiguration
    
    // MARK: - enum cases
    case main
    
    // MARK: - current configuration
    var configuration: Realm.Configuration {
        switch self {
        case .main:
            return RealmConfiguration.mainConfig
        }
    }
    
}
