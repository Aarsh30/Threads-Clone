//
//  Timestamp.swift
//  Threads
//
//  Created by Aarsh  Patel on 08/02/24.
//

import Foundation
import Firebase

extension Timestamp{
//    func timestampString() -> String {
//        let formatter = DateComponentsFormatter()
//        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
//        formatter.maximumUnitCount = 1
//        formatter.unitsStyle = .abbreviated
//        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
//    }
    
    func timestampString() -> String {      
        let date = self.dateValue()
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}
