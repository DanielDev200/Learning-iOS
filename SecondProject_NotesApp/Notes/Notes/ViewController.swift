//
//  ViewController.swift
//  Notes
//
//  Created by Daniel Serrano on 9/23/20.
//  Copyright © 2020 dan_uhl. All rights reserved.
//

import UIKit

/*
 A protocol defines a blueprint of methods, properties, and other requirements that suit a
 particular task or piece of functionality. The protocol can then be adopted by a class,
 structure, or enumeration to provide an actual implementation of those requirements. Any type
 that satisfies the requirements of a protocol is said to conform to that protocol.
 
 In addition to specifying requirements that conforming types must implement, you can extend a
 protocol to implement some of these requirements or to implement additional functionality
 that conforming types can take advantage of.
 */

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var notesTableView: UITableView!
    // array of Note struct
    // global scope in swift means I can declare struct and use it anywhere
    // I'm used to having to import things like in JS
    var notesArray = [Note]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! AddNoteViewController
        
        // editing segue identifier because the same view contoller can be accessed
        // different ways. In the case of CRUD, the resource's form needs to be
        // pre-populated, so the code block below handles that logic
        if (segue.identifier == "updateNoteSegue") {
            // notesTableView.indexPathForSelectedRow.row is the index clicked in the UITableView
            vc.note = notesArray[notesTableView.indexPathForSelectedRow!.row]
            vc.update = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        APIFunctions.functions.fetchNotes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        APIFunctions.functions.fetchNotes()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchNotes()
        
        notesTableView.delegate = self
        notesTableView.dataSource = self
    }
    
    // MARK: - TableView Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // telling the ViewController that the cell is of class NotePrototypeCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath) as! NoteProtoTypeCell
        cell.title.text = notesArray[indexPath.row].note
        cell.note.text = notesArray[indexPath.row].note
        cell.date.text = notesArray[indexPath.row].date
        return cell
    }
}

// MARK: - Custom Delegates

protocol DataDelegate {
    func updateArray(newArray: String)
}

extension ViewController: DataDelegate {
    
    func updateArray(newArray: String) {
        do {
            // weird syntax for these do try blocks the do wraps the code body
            // and the try is by the computation that might break
            notesArray = try JSONDecoder().decode([Note].self, from: newArray.data(using: .utf8)!)
        } catch {
            // HAVE TO DEBUG HERE, WHY DID DECODING SUDDENLY START FAILING
            print("Failed to decode")
        }
        self.notesTableView?.reloadData()
    }
    
}
