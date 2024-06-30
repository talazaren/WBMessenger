//
//  WBMessengerWidgetBundle.swift
//  WBMessengerWidget
//
//  Created by Tatiana Lazarenko on 6/24/24.
//

import WidgetKit
import SwiftUI

@main
struct WBMessengerWidgetBundle: WidgetBundle {
    var body: some Widget {
        WBMessengerWidget()
        WBMessengerWidgetLiveActivity()
    }
}
