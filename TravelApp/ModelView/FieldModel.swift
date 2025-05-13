//
//  FieldModel.swift
//  TravelApp
//
//  Created by hady ka on 13/05/2025.
//

import Foundation


enum AccountFieldType {
    case name, email, password
}

struct AccountField {
    let type: AccountFieldType
    var value: String
    var placeholder: String
}
