//
//  LoggerManager.swift
//  Movies
//
//  Created by Yavuz on 23.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

import Foundation
import Firebase

class LoggerManager {
    static let shared = LoggerManager()
    
    func log(text: String) {
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
            AnalyticsParameterItemID: "id-\(text)",
            AnalyticsParameterItemName: text,
            AnalyticsParameterContentType: "cont"
        ])
    }
}
