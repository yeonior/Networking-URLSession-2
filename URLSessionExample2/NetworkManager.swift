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

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    // MARK: Different GET functions
    
    public func getPosts(completion: @escaping (Posts) -> Void) {
        
        let request = ApiType.posts.request
        let dataTask = session.dataTask(with: request) { [weak self] data, response, error in
            
            var result: Posts
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            guard let self = self else { return result = [] }
            
            if let data = data, error == nil {
                
                do {
                    let elements = try self.decoder.decode(Posts.self, from: data)
                    result = elements
                } catch let error {
                    result = []
                    print(error.localizedDescription)
                }
                
            } else if let error = error {
                result = []
                print(error.localizedDescription)
            } else {
                result = []
                print("Something went wrong!")
            }
        }
        dataTask.resume()
    }
    
    public func getAlbums(completion: @escaping (Albums) -> Void) {
        
        let request = ApiType.albums.request
        let dataTask = session.dataTask(with: request) { [weak self] data, response, error in
            
            var result: Albums
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            guard let self = self else { return result = [] }
            
            if let data = data, error == nil {
                
                do {
                    let elements = try self.decoder.decode(Albums.self, from: data)
                    result = elements
                } catch let error {
                    result = []
                    print(error.localizedDescription)
                }
                
            } else if let error = error {
                result = []
                print(error.localizedDescription)
            } else {
                result = []
                print("Something went wrong!")
            }
        }
        dataTask.resume()
    }
    
    public func getUsers(completion: @escaping (Users) -> Void) {
        
        let request = ApiType.users.request
        let dataTask = session.dataTask(with: request) { [weak self] data, response, error in
            
            var result: Users
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            guard let self = self else { return result = [] }
            
            if let data = data, error == nil {
                
                do {
                    let elements = try self.decoder.decode(Users.self, from: data)
                    result = elements
                } catch let error {
                    result = []
                    print(error.localizedDescription)
                }
                
            } else if let error = error {
                result = []
                print(error.localizedDescription)
            } else {
                result = []
                print("Something went wrong!")
            }
        }
        dataTask.resume()
    }
}
