//
//  ChooseViewNavigation.swift
//  InterviewTask
//
//  Created by Mustafa on 07/07/2023.
//

import UIKit

class ChooseViewNavigation: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor(named: "NearlyBlue")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIButton) {
        
        
    }
    
    @IBAction func dataPressedButton(_ sender: UIButton) {
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
