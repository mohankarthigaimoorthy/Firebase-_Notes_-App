//
//  UserFirebase.swift
//  crashNotes
//
//  Created by Mohan K on 10/04/23.
//

import Foundation
import UIKit
import FirebaseFirestore

extension Note {
    static func build(from documents: [QueryDocumentSnapshot]) ->
    [Note] {
        
        var note = [Note]()
        for document in documents {
            
            note.append(Note(id: document["id"] as! String,
                             noteid: document["noteid"] as! Int,
                             name: document["name"] as! String,
                             email: document["email"] as! String,
                             text: document["text"] as! String,
                             title: document["title"] as! String,
                             content: document["content"] as! String,
                             timestamp: Date(),
                             date: Date(),
                             creationDate: Date()))
        }
        
        return note
    }
}
