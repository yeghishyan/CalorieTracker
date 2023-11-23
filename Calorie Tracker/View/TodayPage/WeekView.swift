//
//  WeekView.swift
//  Calorie Tracker
//
//  Created by valod on 23.11.23.
//

import SwiftUI

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    
    func getFormatted(_ format: String)-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let weekDay = dateFormatter.string(from: self)
        return weekDay
    }
}


struct WeekView: View {
    @Binding var selectedDay: Date
    
    private let calendar = Calendar.current
    private func isSelected(_ day: Date) -> Bool {
        return calendar.isDate(selectedDay, equalTo: day, toGranularity: .day)
    }
    
    private var currentWeek: [Date] {
        let currentDate = Date()
        
        let dayOfWeek = calendar.component(.weekday, from: currentDate)
        let range = calendar.range(of: .day, in: .month, for: currentDate)!
        let daysMonth = (range.lowerBound ..< range.upperBound)
            .compactMap { 
                calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: currentDate)
            }
        
        return daysMonth
    }
    
    var body: some View {
        HStack(spacing: 20) {
            Spacer()
            
            ForEach(currentWeek.prefix(7), id: \.self) { day in
                DayItemView(day: day)
            }
            
            Spacer()
        }
    }
    
    @ViewBuilder
    func DayItemView(day: Date) -> some View {
        Button(action: {
            selectedDay = day
        }) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 35, height: 60)
                .foregroundStyle(isSelected(day) ? Color(hex: "#3977EA") : .clear)
                .overlay(content: {
                    VStack {
                        Text("\(day.getFormatted("EEE"))")
                            .foregroundStyle(isSelected(day) ? .white : .black)
                            .font(.system(size: 11))
                            .padding(.top, 5)
                        Circle()
                            .fill(isSelected(day) ? .white : .clear)
                            .overlay{
                                Text("\(day.get(.day))")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 11, weight: .bold))
                            }
                    }
                    .foregroundStyle(day > .now ? .tertiary : .primary)
                    .padding(5)
                })
        }
    }
}


#Preview {
    WeekView(selectedDay: .constant(.now))
}
