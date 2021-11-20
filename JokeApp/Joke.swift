//
//  Joke.swift
//  JokeApp
//
//  Created by Damian Mikołajczak on 13/08/2021.
//

import Foundation

struct Joke: Codable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}
