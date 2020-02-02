//
//  ViewController.swift
//  Home Control
//
//  Created by Wania Shams on 30/01/2020.
//  Copyright © 2020 Araad Shams. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ConnectHubViewController: UIViewController {

    // IBOutlets
    @IBOutlet weak var txtHubCode: UITextField!
    @IBOutlet weak var btnConnectHub: UIButton!
    
    
    //Global Vars
    let storedValues = UserDefaults.standard
    var correctCode = "0000000000"
    
    
    
    
//    @IBAction func OnButton(_ sender: Any) {
//        let ref = Database.database().reference()
//        ref.child("MAIN").child("hello").setValue(0)
//    }
//
//    @IBAction func OffButton(_ sender: Any) {
//        let ref = Database.database().reference()
//        ref.child("MAIN").child("hello").setValue(1)
//    }
    

    
    @objc func txtHubCodeChanged(_ textField: UITextField) {

        if(txtHubCode.text!.count > 10) {
            txtHubCode.text!.removeLast()
        }
        
        if(txtHubCode.text!.count == 10) {
            btnConnectHub.isEnabled = true
            btnConnectHub.alpha = 1.0
        }
        else {
            btnConnectHub.isEnabled = false
            btnConnectHub.alpha = 0.4
        }
    }
    
    @IBAction func btnConnectHubPressed(_ sender: Any) {
        if(txtHubCode.text! == correctCode) {
            storedValues.set(true, forKey: "HubConnected")
            performSegue(withIdentifier: "goToMainScreen", sender: self)
        }
        else {
            let alertController = UIAlertController(title: "Device Not Found", message:
                "Please check the 10 digit hub code and try again", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
//        storedValues.set(false, forKey: "HubConnected")
        txtHubCode.keyboardType = UIKeyboardType.numberPad
        txtHubCode.addTarget(self, action: #selector(ConnectHubViewController.txtHubCodeChanged), for: UIControl.Event.editingChanged)
        btnConnectHub.alpha = 0.4
        let num1 = Int.random(in: 0...3)
        var num2 = Int.random(in: 0...3)
        while(num2 == num1)
        {
            num2 = Int.random(in: 0...3)
        }
        UserDefaults.standard.set(num1, forKey: "k1")
        UserDefaults.standard.set(num2, forKey: "k2")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if(storedValues.bool(forKey: "HubConnected"))
        {
            performSegue(withIdentifier: "goToMainScreen", sender: self)
        }
    }
    


}

