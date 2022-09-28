//
//  UrlModel.swift
//  JokeApp
//
//  Created by Emir Keles on 7.09.2022.
//

import Foundation

struct UrlModel{
    let urlString = "https://jokeapi-v2.p.rapidapi.com/joke/Dark?format=json&idRange=0-150"
    let headers = [
        "X-RapidAPI-Key"    :   "your_api_key",
        "X-RapidAPI-Host"   :   "jokeapi-v2.p.rapidapi.com"
    ]
}
