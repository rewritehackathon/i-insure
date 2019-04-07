//
//  LoginViewController.swift
//  Marsh_iInsure
//
//  Created by Valeria Torres-Olivares on 4/6/19.
//  Copyright © 2019 Valeria Torres-Olivares. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
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
    //            if error == nil{
    //                self.performSegue(withIdentifier: "loginToHome", sender: self)
    //            }
    //            else{
    //                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
    //                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    //
    //                alertController.addAction(defaultAction)
    //                self.present(alertController, animated: true, completion: nil)
    //            }
    //        }
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // email.delegate = self
        //  password.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        email.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
}

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let tabController = controller as? UITabBarController {
            return topViewController(controller: tabController.selectedViewController)
        }
        if let navController = controller as? UINavigationController {
            return topViewController(controller: navController.visibleViewController)
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
