//
//  Util.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 7.06.2023.
//

import Foundation

func safelyHandleNA(value: String) -> String {
    return value.isEmpty || value == "N/A" ? "-" : value
}


func formattedSearchTitle(inputSting: String) -> String {
    var formattedString = inputSting.trimmingCharacters(in: .whitespaces) // Remove trailing spaces
    formattedString = formattedString.replacingOccurrences(of: " ", with: "+") // Replace spaces with "+"
    return formattedString
}





