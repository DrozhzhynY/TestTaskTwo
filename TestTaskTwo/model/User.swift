//
//  User.swift
//  TestTaskTwo
//
//  Created by admin on 21.08.2022.
//

import Foundation

struct Token: Codable {
    var success: Bool
    var expiresAt: String
    var requestToken: String
    enum CodingKeys: String, CodingKey {
        case success, expiresAt = "expires_at", requestToken = "request_token"
    }
}

struct Session: Codable {
    var success: Bool
    var sessionId: String
    enum CodingKeys: String, CodingKey {
        case success, sessionId = "session_id"
    }
}

struct Success: Codable {
    var success: Bool
}
