//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Tanner Roberts on 4/19/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    //MARK: - Properties
    
    var entry: Entry?
    var journal: Journal?
    
    //MARK: - Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    
override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - Functions
    func updateViews() {
        guard let entry = entry else {return}
        titleTextField.text = entry.entryTitle
        bodyTextView.text = entry.entryBody
    }

    //MARK: - Actions
    @IBAction func clearFields(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let entryTitle = titleTextField.text,!entryTitle.isEmpty,
              let entryBody = bodyTextView.text,!entryBody.isEmpty,
              let journal = journal else {return}
        
        
        if let entry = entry {
            print("")
            print(entry)
        } else {
            EntryController.createEntryWith(entryTitle: entryTitle, entryBody: entryBody, journal: journal)
            
        }
        navigationController?.popViewController(animated: true)
    }
}//End of class
