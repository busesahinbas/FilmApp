//
//  Util.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 7.06.2023.
//

import Foundation

public class Util {
    /// Handle string if empty or equal to "N/A"
    /// - Parameter value: A string value that needs to be checked
    /// - Returns: Returns value or modified string
    func safelyHandleNA(value: String) -> String {
        return value.isEmpty || value == "N/A" ? "-" : value
    }
    
    /// Remove trailing spaces and replace spaces with "+"
    /// - Parameter inputSting: Searched movie name
    /// - Returns: Returns formatted string
    func formattedSearchTitle(inputSting: String) -> String {
        var formattedString = inputSting.trimmingCharacters(in: .whitespaces)
        formattedString = formattedString.replacingOccurrences(of: " ", with: "+")
        return formattedString
    }
}






