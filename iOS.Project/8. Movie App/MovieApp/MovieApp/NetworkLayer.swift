//
//  NetworkLayer.swift
//  MovieApp
//
//  Created by 차동훈 on 2022/12/16.
//

import Foundation

enum MovieAPIType {
    case justURL(urlString: String)
    case searchMovie(querys: [URLQueryItem])
}

enum MovieAPIError: Error {
    case badRUL
}

class NetworkLayer {
    
    // only url
    // url + param
    
    typealias NetworkComplection = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void
    
    func request(type: MovieAPIType, complection: @escaping NetworkComplection) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        do {
            let request = try buildRequest(type: type)
            
            session.dataTask(with: request) { data, response, error in
                print((response as! HTTPURLResponse).statusCode)
                complection(data, response, error)
            }.resume()
            session.finishTasksAndInvalidate()
            
        } catch {
            print(error)
        }
    }
    
    private func buildRequest(type: MovieAPIType) throws -> URLRequest {
        switch type {
        case .justURL(urlString: let urlString):
            guard let hasURL = URL(string: urlString) else {
                throw MovieAPIError.badRUL
            }
            
            var request = URLRequest(url: hasURL)
            request.httpMethod = "GET"
            
            return request
            
        case .searchMovie(querys: let querys):
            var components = URLComponents(string: "https://itunes.apple.com/search")
            components?.queryItems = querys
            guard let hasUrl = components?.url else {
                throw MovieAPIError.badRUL
            }
            
            var request = URLRequest(url: hasUrl)
            request.httpMethod = "GET"
            
            return request
        }
    }
}
