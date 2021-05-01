//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Tanner Roberts on 4/19/21.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    //MARK: - Properties
    
    var journal:Journal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // EntryController.shared.createEntryWith(entryTitle: "Test title", entryBody: "test body")
        
        tableView.reloadData()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return journal?.journalEntries.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)

        guard let journal = journal else {return cell}
        let entry = journal.journalEntries[indexPath.row]
        cell.textLabel?.text = entry.entryTitle
        
        return cell
    }


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            guard let journal = journal else {return}
            let entryToDelete = journal.journalEntries[indexPath.row]
            EntryController.deleteEntry(entry: entryToDelete, journal: journal)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let journal = self.journal
        guard let destinationVC = segue.destination as? EntryDetailViewController else {return}
        destinationVC.journal = journal
        
        if segue.identifier == "toEntryDetailVC" {
//            guard let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? EntryDetailViewController else {return}
            
            guard let journal = journal,
                  let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? EntryDetailViewController else {return}
            destinationVC.journal = journal
            
            let entrySent = journal.journalEntries[indexPath.row]
            destinationVC.entry = entrySent
        }
//        else if segue.identifier == "createNewEntry" {
//            guard let destinationVC = segue.destination as? EntryDetailViewController else {return}
//            destinationVC.journal = journal
//        }
    }
}//End of class
