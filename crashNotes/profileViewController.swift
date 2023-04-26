//
//  profileViewController.swift
//  crashNotes
//
//  Created by Mohan K on 11/04/23.
//

import UIKit
import FirebaseAuth
class profileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutFirebase))
        
        // Do any additional setup after loading the view.
    }
    
    @objc func logoutFirebase() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("user logouts")
        }
        catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            let alert = UIAlertController(title: "Error", message: "we are not able to sign you out, check your internet connection.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
