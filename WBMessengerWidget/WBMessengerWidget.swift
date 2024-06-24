//
//  WBMessengerWidget.swift
//  WBMessengerWidget
//
//  Created by Tatiana Lazarenko on 6/24/24.
//

import WidgetKit
import SwiftUI
import AppIntents

struct Provider: AppIntentTimelineProvider {
    let contacts = Contacts.shared
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), contacts: contacts.contacts, currentIndex: contacts.currentIndex)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), contacts: contacts.contacts, currentIndex: contacts.currentIndex)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
        
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, contacts: contacts.contacts, currentIndex: contacts.currentIndex)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let contacts: [Contact]
    let currentIndex: Int
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
                
                HStack(spacing: 4) {
                    Button(intent: ShowPreviousContactIntent(currentIndex: (entry.currentIndex - 1 + entry.contacts.count) % entry.contacts.count)) {
                        Image(systemName: "chevron.left")
                    }
                    .background(
                        Capsule()
                            .foregroundStyle(.black)
                    )
                    
                    AvatarView(contact: entry.contacts[entry.currentIndex])
                        
                    Button(intent: ShowNextContactIntent(currentIndex: (entry.currentIndex + 1) % entry.contacts.count)) {
                        Image(systemName: "chevron.right")
                    }
                }
                
                Text("Time:")
                Text(entry.date, style: .time)
                Spacer()
            }
            .foregroundStyle(.white)
            .padding()
            .padding(.top, 12)
            .background(LinearGradient(
                gradient: Gradient(colors: [Color("DarkPurple"), Color("LightPurple")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
                )
            )
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
    SimpleEntry(date: .now, contacts: Contacts.shared.contacts, currentIndex: 0)
    SimpleEntry(date: .now, contacts: Contacts.shared.contacts, currentIndex: 0)
}
