//
//  CountryCode.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 7/10/24.
//

import Foundation

struct CountryCode: Identifiable, Hashable {
    var id = UUID()
    var code: String
    var country: String
    var phoneFormat: String
    
    static var countryCodes: [CountryCode] {
        [
            CountryCode(code: "+7", country: "Russia", phoneFormat: "000 000-00-00"),
            CountryCode(code: "+1", country: "USA", phoneFormat: "000-000-0000"),
            CountryCode(code: "+375", country: "Belarus", phoneFormat: "000 000-00-00"),
            CountryCode(code: "+81", country: "Japan", phoneFormat: "090-0000-0000"),
            CountryCode(code: "+7", country: "Kazakhstan", phoneFormat: "000 000-00-00")
        ]
    }
}
