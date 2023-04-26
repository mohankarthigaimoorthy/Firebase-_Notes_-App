//
//  UserService.swift
//  crashNotes
//
//  Created by Mohan K on 10/04/23.
//

import Foundation
import FirebaseFirestore

class UserService  {
    let database = Firestore.firestore()
    func get(collectionID: String, handler: @escaping ([Note]) -> Void) {
        database.collection("User").addSnapshotListener {
            QuerySnapshot, err in
            if let error = err {
                print(error)
                handler([])
                
            }
            else {
                handler(Note.build(from: QuerySnapshot?.documents ?? []))
                
            }
        }
    }
}
