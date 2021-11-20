//
//  APIClient.swift
//  JokeApp
//
//  Created by Damian Mikołajczak on 14/08/2021.
//

import Foundation

struct APIClient {
    let url = URL(string: "https://official-joke-api.appspot.com/jokes/random")
    let session = URLSession.shared
    
    func fetchJoke(completion: @escaping (_ joke: Joke?) -> Void) {
        let request = URLRequest(url: url!)
        
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
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
