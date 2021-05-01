//
//  Journal.swift
//  Journal
//
//  Created by Tanner Roberts on 4/20/21.
//

import Foundation

class Journal: Codable {
    
    var journalEntries: [Entry]
    let journalTitle: String
    let uuid: String
    
    init(journalEntry: [Entry] = [], journalTitle: String, uuid: String = UUID().uuidString) {
        
        self.journalEntries = journalEntry
        self.journalTitle = journalTitle
        self.uuid = uuid
    }
} //End of class

//MARK: - Equatable

extension Journal: Equatable {
    static func == (lhs: Journal, rhs: Journal) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
