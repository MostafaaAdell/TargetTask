//
//  K.swift
//  InterviewTask
//
//  Created by Mustafa on 07/07/2023.
//

import UIKit
struct Constants {

    static let appName = "⚡️Target Task"
    static let registerIdent = "RegisterView"
    static let loginIdent = "LoginView"
    static let cameraIdent = "CameraView"
    
   static func  showErrorAlert(message: String , viewController:UIViewController){
        let ac = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(ac, animated: true)
    }
    
}
