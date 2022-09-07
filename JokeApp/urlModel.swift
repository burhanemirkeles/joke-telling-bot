//
//  UrlModel.swift
//  JokeApp
//
//  Created by Emir Keles on 7.09.2022.
//

import Foundation

struct UrlModel{
    let urlString = "https://jokeapi-v2.p.rapidapi.com/joke/Any?format=json&idRange=0-150&flags=nsfw,racist,sexist,explicit"
    let headers = [
        "X-RapidAPI-Key"    :   apiKeyModel.init().apiKey,
        "X-RapidAPI-Host"   :   "jokeapi-v2.p.rapidapi.com"
    ]
}
