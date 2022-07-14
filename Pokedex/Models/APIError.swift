//
//  APIError.swift
//  Pokedex
//
//  Created by Matthew Lock on 14/07/2022.
//

import Foundation

enum APIError: Error {
    case noResponse
    case no200
    case noData
}
