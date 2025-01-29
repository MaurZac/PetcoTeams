//
//  DateFormatter.swift
//  PetcoTeams
//
//  Created by MaurZac on 26/01/25.
//
import Foundation
// Date decoding
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter
}()
