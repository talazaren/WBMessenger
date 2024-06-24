//
//  WBMessengerWidget.swift
//  WBMessengerWidget
//
//  Created by Tatiana Lazarenko on 6/24/24.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    let contacts = Contacts.shared.contacts
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), contacts: contacts)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), contacts: contacts)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, contacts: contacts)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let contacts: [Contact]
}

struct WBMessengerWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 4) {
                Image(systemName: "person.2.fill")
                Text("Контакты")
                Spacer()
            }
            .font(.system(size: 17, weight: .bold))
            .padding(.bottom, 4)
            
            
            
            Text(entry.date, style: .time)

        }
    }
}

struct WBMessengerWidget: Widget {
    let kind: String = "WBMessengerWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WBMessengerWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

#Preview(as: .systemSmall) {
    WBMessengerWidget()
} timeline: {
    let contacts = Contacts.shared.contacts
    SimpleEntry(date: .now, contacts: contacts)
    SimpleEntry(date: .now, contacts: contacts)
}
