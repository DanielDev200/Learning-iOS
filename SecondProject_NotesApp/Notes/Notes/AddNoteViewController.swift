//
//  AddNoteViewController.swift
//  Notes
//
//  Created by Daniel Serrano on 10/1/20.
//  Copyright © 2020 dan_uhl. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    // declaring a nullable note object
    var note: Note?
    var update = false;
    
    @IBAction func deleteClick(_ sender: Any) {
        APIFunctions.functions.deleteNote(id: note!._id)
        self.navigationController?.popViewController(animated: true)
    }
    
    // an action is a function that an UI element uses
    // think JS events and their handlers
    @IBAction func saveClick(_ sender: Any) {
        
        // would need to validation messaging here
        if (titleTextField.text == "" || bodyTextField.text == "") {
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy-MM-dd"
        let date = dateFormatter.string(from: Date())
        
        if (update == true) {
            APIFunctions.functions.updateNote(date: date, title: titleTextField.text!, note: bodyTextField.text, id: note!._id)
        } else {
            APIFunctions.functions.addNote(date: date, title: titleTextField.text!, note: bodyTextField.text)
        }
        
        // navigates to previous screen
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (update == false) {
            self.deleteButton.isEnabled = false
            self.deleteButton.title = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (update == true) {
            titleTextField.text = note?.title
            bodyTextField.text = note!.note
        }
    }
}
