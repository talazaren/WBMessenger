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
        SimpleEntry(date: Date(), contacts: contacts.contacts, currentIndex: contacts.currentIndex, showOnlineContacts: contacts.showOnlineContacts)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), contacts: contacts.contacts, currentIndex: contacts.currentIndex, showOnlineContacts: contacts.showOnlineContacts)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var filteredContacts: [Contact] {
            if contacts.showOnlineContacts {
                return contacts.contacts.filter { $0.onlineStatusMessage == "Online" }
            } else {
                return contacts.contacts
            }
        }
        
        var entries: [SimpleEntry] = []
        
        let currentDate = Date()
        for secondOffset in 0 ..< 10 {
            let entryDate = Calendar.current.date(byAdding: .second, value: secondOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, contacts: filteredContacts, currentIndex: contacts.currentIndex, showOnlineContacts: contacts.showOnlineContacts)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let contacts: [Contact]
    let currentIndex: Int
    let showOnlineContacts: Bool
}

struct WBMessengerWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
            VStack(alignment: .center) {
                HStack(spacing: 4) {
                    Image(systemName: "person.2.fill")
                    Text("Контакты")
                    Spacer()
                }
                .font(.system(size: 17, weight: .bold))
                
                if entry.contacts.isEmpty {
                    Text("no one")
                } else {
                    HStack(spacing: 4) {
                        Button(intent: ShowPreviousContactIntent(currentIndex: (entry.currentIndex - 1 + entry.contacts.count) % entry.contacts.count)) {
                            Image(systemName: "chevron.left")
                        }
                        .background(
                            Capsule()
                                .foregroundStyle(Color("LightPurple"))
                        )
                        
                        AvatarView(contact: entry.contacts[entry.currentIndex])
                        
                        Button(intent: ShowNextContactIntent(currentIndex: (entry.currentIndex + 1) % entry.contacts.count)) {
                            Image(systemName: "chevron.right")
                        }
                        .background(
                            Capsule()
                                .foregroundStyle(Color("LightPurple"))
                        )
                    }
                }
                
                Button(intent:
                    ShowOnlineContacts()
                ) {
                    Text(entry.showOnlineContacts ? "Все" : "Онлайн")
                }
                .background(
                    Capsule()
                        .foregroundStyle(Color("DarkPurple"))
                )
                
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
    SimpleEntry(date: .now, contacts: Contacts.shared.contacts, currentIndex: 0, showOnlineContacts: Contacts.shared.showOnlineContacts)
    SimpleEntry(date: .now, contacts: Contacts.shared.contacts, currentIndex: 0, showOnlineContacts: Contacts.shared.showOnlineContacts)
}