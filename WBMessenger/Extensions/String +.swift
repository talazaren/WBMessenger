//
//  String +.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 7/16/24.
//

import Foundation

extension String {
    subscript(offset: Int) -> Character {
        let index = index(startIndex, offsetBy: offset)
        return self[index]
    }
}
