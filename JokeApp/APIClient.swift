//
//  APIClient.swift
//  JokeApp
//
//  Created by Damian Mikołajczak on 14/08/2021.
//

import Foundation

struct APIClient {
    let urlModel = UrlModel()
    let session = URLSession.shared
    
    func fetchJoke(completion: @escaping (_ joke: Joke?) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: urlModel.urlString)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
      
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = urlModel.headers
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Joke.self, from: data)
                completion(result)
                
            } catch {
                completion(nil)
                print(error)
            }
        })
        
        dataTask.resume()
    }
}
