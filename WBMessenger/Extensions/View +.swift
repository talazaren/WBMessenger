//
//  View + Ext.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/18/24.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
