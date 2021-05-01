//
//  EntryController.swift
//  Journal
//
//  Created by Tanner Roberts on 4/19/21.
//

import Foundation

class EntryController {
    //MARK: -  Properties
    
    
    
    //MARK: - Functions
static func createEntryWith(entryTitle: String, entryBody: String, journal:Journal) {
        let newEntry = Entry(entryTitle: entryTitle, entryBody: entryBody)
        JournalController.sharedInstance.addEntryTo(journal: journal, entry: newEntry)
    }
    
static func deleteEntry(entry: Entry, journal: Journal) {
        JournalController.sharedInstance.removeEntryFrom(journal: journal, entry: entry)
    
    }
    
    static func update(entry: Entry, title: String, body: String) {
        entry.entryTitle = title
        entry.entryBody = body
        JournalController.sharedInstance.saveToPersistenceStore()
    }
    
    
    
}//End of class
