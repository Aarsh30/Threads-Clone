//
//  Profilethreadfilter.swift
//  Threads
//
//  Created by Aarsh  Patel on 05/02/24.
//

import Foundation
enum Profilethreadfilter: Int,CaseIterable,Identifiable{
    case threads
    case replies

    
    var title: String
    {
        switch self{
        case .threads: return "Threads"
        case .replies: return "Replies"
        
        }
    }
    var id: Int{return self.rawValue}
}
