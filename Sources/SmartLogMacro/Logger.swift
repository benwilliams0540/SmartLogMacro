//
//  Logger.swift
//  Logger
//
//  Created by Ayren King on 02/5/25.
//

import OSLog

@freestanding(expression)
public macro log(
    _ logger: Logger,
    _ logLevel: OSLogType,
    _ message: String,
    privacy: OSLogPrivacy = .auto
) = #externalMacro(module: "SmartLogMacroMacros", type: "SmartLog")

public extension Logger {
    /// Logs the web socket events and messages
    static let webSocket = Logger(category: .webSocket)

    /// Logs push notifications received
    static let pushNotifications = Logger(category: .pushNotifications)

    /// Logs events with Remote Config
    static let remoteConfig = Logger(category: .remoteConfig)

    /// Logs events with Sale Registration
    static let saleRegistration = Logger(category: .saleRegistration)

    /// Logs events with Authentication
    static let auth = Logger(category: .auth)

    ///Logs events for consignment form
    static let consignment = Logger(category: .consignment)

    /// Logs events for user lists
    static let userLists = Logger(category: .userLists)

    /// Logs events for bids
    static let bids = Logger(category: .bids)
}

extension Logger {
    private static let subsystem = Bundle.main.bundleIdentifier ?? "com.phillips.phoenix"

    init(category: LoggerCategory) {
        self.init(subsystem: Self.subsystem, category: category.rawValue)
    }
}

public enum LoggerCategory: String, CaseIterable {
    case webSocket = "Web Socket"
    case pushNotifications = "Push Notifications"
    case remoteConfig = "Remote Config"
    case saleRegistration = "Sale Registration"
    case auth = "Auth"
    case consignment = "Consignment"
    case userLists = "User Lists"
    case bids = "Bids"

    func getLogger() -> Logger {
        switch self {
        case .webSocket:
            return .webSocket
        case .pushNotifications:
            return .pushNotifications
        case .remoteConfig:
            return .remoteConfig
        case .saleRegistration:
            return .saleRegistration
        case .auth:
            return .auth
        case .consignment:
            return .consignment
        case .bids:
            return .bids
        case .userLists:
            return .userLists
        }
    }
}
