//
//  RegisterViewController.swift
//  InterviewTask
//
//  Created by Mustafa on 07/07/2023.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor(named: "NearlyBlue")
    }
    
    @IBAction func pressRegister(_ sender: UIButton) {
        
        if let email = emailTextfield.text ,let password = passwordTextfield.text{
            
            Auth.auth().createUser(withEmail: email, password: password){ authResult , error in
                if let _ = error {
                    Constants.showErrorAlert(message: "Invalid username or password", viewController: self)
                }else{
                    self.emailTextfield.text = ""
                    self.passwordTextfield.text = ""
                    self.performSegue(withIdentifier: Constants.registerIdent, sender: self)

                    
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
