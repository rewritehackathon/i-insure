//
//  Login_ViewController.swift
//  Marsh_iInsure
//
//  Created by Valeria Torres-Olivares on 4/6/19.
//  Copyright © 2019 Valeria Torres-Olivares. All rights reserved.
//

import UIKit
import FirebaseAuth

class Login_ViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func loginAction(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error == nil {
                // Safe Present
                if let home = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
                {
                    UIApplication.topViewController()?.present(home, animated: true, completion: nil)
                }
            }
            else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
            }
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
