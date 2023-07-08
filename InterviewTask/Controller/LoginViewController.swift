//
//  LoginViewController.swift
//  InterviewTask
//
//  Created by Mustafa on 07/07/2023.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor(named: "NearlyBlue")


    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text ,let password = passwordTextfield.text{
        
            Auth.auth().signIn(withEmail: email, password: password){ authResult , error in
              

                    if error != nil{
                        Constants.showErrorAlert(message: "Invalid username or password", viewController: self)
                        
                    }else{
                        self.performSegue(withIdentifier: Constants.loginIdent, sender: self)
                    
                }
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
