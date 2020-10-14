//
//  APIFunctions.swift
//  Notes
//
//  Created by Daniel Serrano on 9/25/20.
//  Copyright © 2020 dan_uhl. All rights reserved.
//

import Foundation
import Alamofire

// Decodeable is "a type that can decode itself from an external representation"
struct Note: Decodable {
    var title: String
    var date: String
    var _id: String
    var note: String
}

class APIFunctions {
    
    var delegate: DataDelegate?
    // expose functions insde APIFunctions
    static let functions = APIFunctions()
    
    func fetchNotes() {
        AF.request("http://192.168.1.99:8081/fetch").response { response in
            // converts response into utf8 string format
            let data = String(data: response.data!, encoding: .utf8)
            // fires custom delegate where APIFunctions is instantiated
            self.delegate?.updateArray(newArray: data!)
        }
    }
    
    func addNote(date: String, title: String, note: String) {
        AF.request("http://192.168.1.99:8081/create", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "date": date, "note": note]).responseJSON {
            response in
            print("Note added")
        }
    }
    
    func updateNote(date: String, title: String, note: String, id: String) {
        AF.request("http://192.168.1.99:8081/update", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "date": date, "note": note, "id": id]).responseJSON {
            response in
            print("Note updated")
        }
    }
    
    func deleteNote(id: String) {
        AF.request("http://192.168.1.99:8081/delete", method: .post, encoding: URLEncoding.httpBody, headers: ["id": id]).responseJSON {
            response in
            print("Note deleted")
        }
    }
}
