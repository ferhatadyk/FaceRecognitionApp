//
//  ViewController.swift
//  FaceRecognitionApp
//
//  Created by Ferhat Adiyeke on 31.12.2022.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func click(_ sender: UIButton) {
        
       let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Gerçekten sen misin ?") { success, error in
                if success == true {
                    
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "to", sender: nil)
                    }
                    
                }
            }
        }
        
    }
    
}

