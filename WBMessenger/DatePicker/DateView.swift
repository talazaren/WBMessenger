//
//  DateView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 6/29/24.
//

import SwiftUI


struct DateView: View {
    @State private var date = Date()
    @State private var selectedLanguage: Language = .russian
    @State private var expandedRows: Set<UUID> = []
    
    let localizedDays = [
        DayLocalization(russian: "Позавчера", english: "Day Before Yesterday", french: "Avant-hier", italian: "L'altro ieri", japanese: "一昨日"),
        DayLocalization(russian: "Вчера", english: "Yesterday", french: "Hier", italian: "Ieri", japanese: "昨日"),
        DayLocalization(russian: "Сегодня", english: "Today", french: "Aujourd'hui", italian: "Oggi", japanese: "今日"),
        DayLocalization(russian: "Завтра", english: "Tomorrow", french: "Demain", italian: "Domani", japanese: "明日"),
        DayLocalization(russian: "Послезавтра", english: "Day After Tomorrow", french: "Après-demain", italian: "Dopodomani", japanese: "明後日")
    ]
    
    var body: some View {
        VStack{
            DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .padding([.leading, .trailing], 20)
            
            Picker("Select Language", selection: $selectedLanguage) {
                ForEach(Language.allCases) { language in
                    Text(language.displayName).tag(language)
                }
            }
            .pickerStyle(.segmented)
            .padding([.leading, .trailing], 20)
            
            List {
                ForEach(localizedDays) { day in
                    DisclosureGroup(isExpanded: Binding(
                        get: { expandedRows.contains(day.id) },
                        set: { isExpanded in
                            if isExpanded {
                                expandedRows.insert(day.id)
                            } else {
                                expandedRows.remove(day.id)
                            }
                        }
                    )) {
                        Text(formatDate(for: day, isSpellOut: true))
                            .foregroundStyle(Color.gray)
                    } label: {
                        HStack {
                            Text(day.localizedName(for: selectedLanguage))
                            Spacer()
                            Text(formatDate(for: day, isSpellOut: false))
                        }
                    }
                    .alignmentGuide(.listRowSeparatorTrailing) { separator in
                        separator.width - 2
                    }
                }
            }
            .listStyle(.plain)
            .padding(.top, 10)
            
            Spacer()
        }
    }
    
    private func localizedDay(_ day: DayLocalization) -> String {
        switch selectedLanguage {
            case .russian: return day.russian
            case .english: return day.english
            case .french: return day.french
            case .italian: return day.italian
            case .japanese: return day.japanese
        }
    }
    
    func formatDate(for day: DayLocalization, isSpellOut: Bool) -> String {
        let calendar = Calendar.current
        let offset = localizedDays.firstIndex(where: { $0.id == day.id })! - 2
        let newDate = calendar.date(byAdding: .day, value: offset, to: date)!
        if isSpellOut {
            return "\(dateFormatSpellOut: newDate, for: selectedLanguage.locale)"
        }
        return "\(dateFormat: newDate, for: selectedLanguage.locale)"
    }
}



#Preview {
    DateView()
}
