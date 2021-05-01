//
//  JournalController.swift
//  Journal
//
//  Created by Tanner Roberts on 4/20/21.
//

import Foundation

class JournalController {

    //MARK: - Properties
    //SharedInstance and SOT
    static let sharedInstance = JournalController()
    var journals: [Journal] = []
    
    //MARK: - Function
    func createJournalWith(title: String) {
        let newJournal = Journal(journalTitle: title)
        journals.append(newJournal)
        saveToPersistenceStore()
    }
    
    func deleteJournal(journal:Journal) {
        guard let index = journals.firstIndex(of: journal) else {return}
        journals.remove(at: index)
        saveToPersistenceStore()
    }
    
   func addEntryTo(journal: Journal, entry: Entry) {
        journal.journalEntries.append(entry)
    }
    
    func removeEntryFrom (journal: Journal, entry: Entry) {
        guard let index = journal.journalEntries.firstIndex(of: entry) else {return}
        journal.journalEntries.remove(at: index)
    }
    
    
    //MARK: - Persistence
    func createPersistenceStore() -> URL {
    let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let fileURL = url[0].appendingPathComponent("Journal.json")
    return fileURL
    }

    func saveToPersistenceStore() {
    do {
        let data = try JSONEncoder().encode(journals)
        try data.write(to: createPersistenceStore())
    } catch {
        print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
    }
    }

    func loadFromPersistenceStore() {
    do {
        let data = try Data(contentsOf: createPersistenceStore())
        journals = try JSONDecoder().decode([Journal].self, from: data)
    } catch {
        print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
    }
    }

}//End of class
