//
//  cityModel.swift
//  TravelApp
//
//  Created by hady ka on 30/04/2025.
//

import Foundation

struct DataItem: Codable {
    let title: String?
    let description: String?
    let url: String?
}

// ApiResponse.swift
struct ApiResponse: Codable {
    let status: String?
    let code: Int?
    let locale: String?
    let seed: String?
    let total: Int?
    let data: [DataItem]?
}
struct Deal {
    let destination: String
    let price: String
    let imageName: String
    let systemIconName: String
}
