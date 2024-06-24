//
//  WBMessengerWidgetLiveActivity.swift
//  WBMessengerWidget
//
//  Created by Tatiana Lazarenko on 6/24/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WBMessengerWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WBMessengerWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WBMessengerWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WBMessengerWidgetAttributes {
    fileprivate static var preview: WBMessengerWidgetAttributes {
        WBMessengerWidgetAttributes(name: "World")
    }
}

extension WBMessengerWidgetAttributes.ContentState {
    fileprivate static var smiley: WBMessengerWidgetAttributes.ContentState {
        WBMessengerWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WBMessengerWidgetAttributes.ContentState {
         WBMessengerWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WBMessengerWidgetAttributes.preview) {
   WBMessengerWidgetLiveActivity()
} contentStates: {
    WBMessengerWidgetAttributes.ContentState.smiley
    WBMessengerWidgetAttributes.ContentState.starEyes
}
