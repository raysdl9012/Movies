//
//  ManagerRequest.swift
//  Movies
//
//  Created by Reinner Daza Leiva on 14/06/21.
//

import Foundation


typealias COMPLETION_HTTP = (_ data: Data?, _ error: Error? ) -> Void
typealias COMPLETION_DATA = (_ data: Any?, _ error: Error? ) -> Void

enum ENPOINT_MOVIE: String {
    case BASE_URL = "https://api.themoviedb.org/3/movie/"
    case NOW_PLAYING = "now_playing"
}

enum METHOD_HTTP: String {
    case GET = "GET"
    case POST = "POST"
}

class ManagerRequest {
    
    static let instance = ManagerRequest()
    
    private var sessionRequest: URLSession
    
    init() {
        print("Init Manager REQUEST")
        self.sessionRequest = URLSession.shared
    }
    
    public func makeRequest(method:METHOD_HTTP, baseUrl:ENPOINT_MOVIE, endpoint: ENPOINT_MOVIE, params: String, body: Dictionary<String,Any>?, completion: @escaping COMPLETION_HTTP){
        
        guard let url =  URL(string: baseUrl.rawValue + endpoint.rawValue + params) else { return print("ERROR URL") }
        print("*** \(url)")
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        self.sessionRequest.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil, let response = response as? HTTPURLResponse else {
                completion(nil, error)
                return
            }
            
            if (response.statusCode == 200) {
                completion(data, nil)
            }
            
        }.resume()
        
        
    }
    
    public func makeRequestAlamoreFire(baseUrl:ENPOINT_MOVIE, endpoint: ENPOINT_MOVIE, params: String, body: Dictionary<String,Any>){
        
    }
}
