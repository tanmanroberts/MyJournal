//
//  JournalListViewController.swift
//  Journal
//
//  Created by Tanner Roberts on 4/20/21.
//

import UIKit

class JournalListViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var journalTitleTextField: UITextField!
    @IBOutlet weak var journalListTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        journalListTableView.reloadData()
        self.journalListTableView.delegate = self
        self.journalListTableView.dataSource = self
        JournalController.sharedInstance.saveToPersistenceStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        journalListTableView.reloadData()
    }
    
    //MARK: - Actions
    
    @IBAction func createNewJournalButtonTapped(_ sender: Any) {
        guard let journalTitleText = journalTitleTextField.text, !journalTitleText.isEmpty else {return}
        JournalController.sharedInstance.createJournalWith(title: journalTitleText)
        
        journalListTableView.reloadData()
        journalTitleTextField.text = ""
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEntryList" {
            guard let index = journalListTableView.indexPathForSelectedRow, let destinationVC = segue.destination as? EntryListTableViewController else {return}
            
            let journalToSend = JournalController.sharedInstance.journals[index.row]
            destinationVC.journal = journalToSend
            
        }
    }
    

}
//MARK: - Extensions

extension JournalListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        JournalController.sharedInstance.journals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = journalListTableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath)
        
        let journal = JournalController.sharedInstance.journals[indexPath.row]
        
        cell.textLabel?.text = journal.journalTitle
        cell.detailTextLabel?.text = "\(journal.journalEntries.count)"
        
        
//        if journal.journalEntries.count == 1 {
//            cell.detailTextLabel?.text = "1 Entry"
//        } else {
//            cell.detailTextLabel?.text = "\(journal.journalEntries.count) Entries"
//        }
        
        return cell
        
    }
    
    
}
