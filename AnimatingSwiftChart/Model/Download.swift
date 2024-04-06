//
//  Download.swift
//  AnimatingSwiftChart
//
//  Created by Pushpank Kumar on 06/04/24.
//

import Foundation

struct Download: Identifiable {
    var id: UUID = .init()
    var date: Date
    var value: Double
    var isAnimated: Bool = false
    
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: date)
    }
}

var sampleDownload: [Download] = [
    .init(date: .createDate(1, 8, 2023), value: 2500),
    .init(date: .createDate(1, 9, 2023), value: 3500),
    .init(date: .createDate(1, 10, 2023), value: 1500),
    .init(date: .createDate(1, 11, 2023), value: 9500),
    .init(date: .createDate(1, 12, 2023), value: 1950),
    .init(date: .createDate(1, 1, 2024), value: 5100)]


extension Date {
    static func createDate(_ day: Int, _ month: Int, _ year: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents) ?? .init()
        return date
    }
}

enum ChartType: String, CaseIterable, Identifiable {
    case bar = "Bar"
    case line = "Line"
    case pie = "Pie"
    
    var id: String {
        return self.rawValue
    }
}
