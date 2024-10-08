//
//  RMError.swift
//  RickAndMorty
//
//  Created by serhat on 27.06.2024.
//

import Foundation

enum RMError: String,Error {
    case invalidUserName = "This info created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
