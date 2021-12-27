//
//  NetworkManager.swift
//  URLSessionExample2
//
//  Created by Ruslan on 27.12.2021.
//

import Foundation

enum ApiType {
    
    // some API types
    case login
    case posts
    case albums
    case users
    
    // base URL of different JSON types
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    // paths to different JSONs
    var path: String {
        switch self {
        case .login:
            return "login"
        case .posts:
            return "posts"
        case .albums:
            return "albums"
        case .users:
            return "users"
        }
    }
    
    // headers of HTTP message
    var headers: [String: String] {
        switch self {
        case .login:
            return ["authToken": "login"]
        default:
            return [:]
        }
    }
    
    // request configuring
    var request: URLRequest {
        let url = URL(fileURLWithPath: path, relativeTo: baseURL)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        switch self {
        case .login:
            request.httpMethod = "POST"
            return request
        default:
            request.httpMethod = "GET"
            return request
        }
    }
}
