//
//  Entry.swift
//  Journal
//
//  Created by Tanner Roberts on 4/19/21.
//

import Foundation

class Entry: Codable {
    var entryTitle: String
    var entryBody: String
    let entryTimeStamp: Date
    let uuid: String
    
    init(entryTitle: String, entryBody: String, entryTimeStamp: Date = Date(), uuid: String = UUID().uuidString) {
        self.entryTitle = entryTitle
        self.entryBody = entryBody
        self.entryTimeStamp = entryTimeStamp
        self.uuid = uuid
    }
}//End of class

//MARK: - Extensions
extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
}
