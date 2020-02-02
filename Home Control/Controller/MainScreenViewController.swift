//
//  MainScreenViewController.swift
//  Home Control
//
//  Created by Wania Shams on 31/01/2020.
//  Copyright © 2020 Araad Shams. All rights reserved.
//

// 1 - Relay
// 2 - RGB LED
// 3 - Servo(lock)
// 4 - Doorbell

import UIKit
import Firebase


class MainScreenViewController: UIViewController {

    
    
    //IBOutlets
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    @IBOutlet weak var btnOuter1: UIButton!
    @IBOutlet weak var btnOuter2: UIButton!
    @IBOutlet weak var btnOuter3: UIButton!
    @IBOutlet weak var btnOuter4: UIButton!
    @IBOutlet weak var btnOuter5: UIButton!
    @IBOutlet weak var btnOuter6: UIButton!
    @IBOutlet weak var btnOuter7: UIButton!
    @IBOutlet weak var btnOuter8: UIButton!
    @IBOutlet weak var btnOuter9: UIButton!
    
    @IBOutlet weak var btnInner1: UIButton!
    @IBOutlet weak var btnInner2: UIButton!
    @IBOutlet weak var btnInner3: UIButton!
    @IBOutlet weak var btnInner4: UIButton!
    @IBOutlet weak var btnInner5: UIButton!
    @IBOutlet weak var btnInner6: UIButton!
    @IBOutlet weak var btnInner7: UIButton!
    @IBOutlet weak var btnInner8: UIButton!
    @IBOutlet weak var btnInner9: UIButton!
    
    @IBOutlet weak var imgDev1: UIImageView!
    @IBOutlet weak var imgDev2: UIImageView!
    @IBOutlet weak var imgDev3: UIImageView!
    @IBOutlet weak var imgDev4: UIImageView!
    @IBOutlet weak var imgDev5: UIImageView!
    @IBOutlet weak var imgDev6: UIImageView!
    @IBOutlet weak var imgDev7: UIImageView!
    @IBOutlet weak var imgDev8: UIImageView!
    @IBOutlet weak var imgDev9: UIImageView!
    
    @IBOutlet weak var stsDev1: UILabel!
    @IBOutlet weak var stsDev2: UILabel!
    @IBOutlet weak var stsDev3: UILabel!
    @IBOutlet weak var stsDev4: UILabel!
    @IBOutlet weak var stsDev5: UILabel!
    @IBOutlet weak var stsDev6: UILabel!
    @IBOutlet weak var stsDev7: UILabel!
    @IBOutlet weak var stsDev8: UILabel!
    @IBOutlet weak var stsDev9: UILabel!
    
    @IBOutlet weak var nameDev1: UILabel!
    @IBOutlet weak var nameDev2: UILabel!
    @IBOutlet weak var nameDev3: UILabel!
    @IBOutlet weak var nameDev4: UILabel!
    @IBOutlet weak var nameDev5: UILabel!
    @IBOutlet weak var nameDev6: UILabel!
    @IBOutlet weak var nameDev7: UILabel!
    @IBOutlet weak var nameDev8: UILabel!
    @IBOutlet weak var nameDev9: UILabel!
    
    
    
    //Globals
    var storage = UserDefaults.standard
    var curNumDevices = 0
    
    var deviceName1 = ""
    var deviceName2 = ""
    var deviceName3 = ""
    var deviceName4 = ""
    var deviceName5 = ""
    var deviceName6 = ""
    var deviceName7 = ""
    var deviceName8 = ""
    var deviceName9 = ""
    
    var deviceStateStr1 = ""
    var deviceStateStr2 = ""
    var deviceStateStr3 = ""
    var deviceStateStr4 = ""
    var deviceStateStr5 = ""
    var deviceStateStr6 = ""
    var deviceStateStr7 = ""
    var deviceStateStr8 = ""
    var deviceStateStr9 = ""
    
    var temp = 0
    var humidity = 0
    var safe = true
    
    
    //IBActions
    @IBAction func deviceOnePressed(_ sender: Any) {
        let ref = Database.database().reference()
        let userRef = ref.child("Device1")
        if(stsDev1.text! == "ON")
        {
//            stsDev1.text = "OFF"
            userRef.updateChildValues(["state": 0])
        }
        else
        {
//            stsDev1.text = "ON"
            userRef.updateChildValues(["state": 1])
        }
    }
    
    @IBAction func deviceTwoPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToRGBSettings", sender: self)
    }
    
    @IBAction func deviceThreePressed(_ sender: Any) {
        let ref = Database.database().reference()
        let userRef = ref.child("Device3")
        if(stsDev3.text! == "LOCKED")
        {
//            stsDev3.text = "OPEN"
            userRef.updateChildValues(["state": 0])
        }
        else
        {
//            stsDev3.text = "LOCKED"
            userRef.updateChildValues(["state": 1])
        }
    }
    
    @IBAction func deviceFourPressed(_ sender: Any) {

    }
    
    @IBAction func deviceFivePressed(_ sender: Any) {
    }
    
    @IBAction func deviceSixPressed(_ sender: Any) {
    }
    
    @IBAction func deviceSevenPressed(_ sender: Any) {
    }
    
    @IBAction func deviceEightPressed(_ sender: Any) {
    }
    
    @IBAction func deviceNinePressed(_ sender: Any) {
    }
    
    
    //Methods + Functions
    func showDev1()
    {
        btnOuter1.isHidden = false
        btnInner1.isHidden = false
        imgDev1.isHidden = false
        stsDev1.isHidden = false
        nameDev1.isHidden = false
    }
    
    func showDev2()
    {
        btnOuter2.isHidden = false
        btnInner2.isHidden = false
        imgDev2.isHidden = false
        stsDev2.isHidden = false
        nameDev2.isHidden = false
    }
    
    func showDev3()
    {
        btnOuter3.isHidden = false
        btnInner3.isHidden = false
        imgDev3.isHidden = false
        stsDev3.isHidden = false
        nameDev3.isHidden = false
    }
    
    func showDev4()
    {
        btnOuter4.isHidden = false
        btnInner4.isHidden = false
        imgDev4.isHidden = false
        stsDev4.isHidden = false
        nameDev4.isHidden = false
    }
    
    func showDev5()
    {
        btnOuter5.isHidden = false
        btnInner5.isHidden = false
        imgDev5.isHidden = false
        stsDev5.isHidden = false
        nameDev5.isHidden = false
    }
    
    func showDev6()
    {
        btnOuter6.isHidden = false
        btnInner6.isHidden = false
        imgDev6.isHidden = false
        stsDev6.isHidden = false
        nameDev6.isHidden = false
    }
    
    func showDev7()
    {
        btnOuter7.isHidden = false
        btnInner7.isHidden = false
        imgDev7.isHidden = false
        stsDev7.isHidden = false
        nameDev7.isHidden = false
    }
    
    func showDev8()
    {
        btnOuter8.isHidden = false
        btnInner8.isHidden = false
        imgDev8.isHidden = false
        stsDev8.isHidden = false
        nameDev8.isHidden = false
    }
    
    func showDev9()
    {
        btnOuter9.isHidden = false
        btnInner9.isHidden = false
        imgDev9.isHidden = false
        stsDev9.isHidden = false
        nameDev9.isHidden = false
    }
    
    
    func showDev(num: Int)
    {
        if(num == 1)
        {
            showDev1()
        }
        if(num == 2)
        {
            showDev2()
        }
        if(num == 3)
        {
            showDev3()
        }
        if(num == 4)
        {
            showDev4()
        }
        if(num == 5)
        {
            showDev5()
        }
        if(num == 6)
        {
            showDev6()
        }
        if(num == 7)
        {
            showDev7()
        }
        if(num == 8)
        {
            showDev8()
        }
        if(num == 9)
        {
            showDev9()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnOuter1.isHidden = true
        btnOuter2.isHidden = true
        btnOuter3.isHidden = true
        btnOuter4.isHidden = true
        btnOuter5.isHidden = true
        btnOuter6.isHidden = true
        btnOuter7.isHidden = true
        btnOuter8.isHidden = true
        btnOuter9.isHidden = true

        btnInner1.isHidden = true
        btnInner2.isHidden = true
        btnInner3.isHidden = true
        btnInner4.isHidden = true
        btnInner5.isHidden = true
        btnInner6.isHidden = true
        btnInner7.isHidden = true
        btnInner8.isHidden = true
        btnInner9.isHidden = true

        imgDev1.isHidden = true
        imgDev2.isHidden = true
        imgDev3.isHidden = true
        imgDev4.isHidden = true
        imgDev5.isHidden = true
        imgDev6.isHidden = true
        imgDev7.isHidden = true
        imgDev8.isHidden = true
        imgDev9.isHidden = true

        stsDev1.isHidden = true
        stsDev2.isHidden = true
        stsDev3.isHidden = true
        stsDev4.isHidden = true
        stsDev5.isHidden = true
        stsDev6.isHidden = true
        stsDev7.isHidden = true
        stsDev8.isHidden = true
        stsDev9.isHidden = true

        nameDev1.isHidden = true
        nameDev2.isHidden = true
        nameDev3.isHidden = true
        nameDev4.isHidden = true
        nameDev5.isHidden = true
        nameDev6.isHidden = true
        nameDev7.isHidden = true
        nameDev8.isHidden = true
        nameDev9.isHidden = true

        let ref = Database.database().reference() // your ref ie. root.child("users").child("stephenwarren001@yahoo.com")

        if(storage.bool(forKey: "Dev1Connected"))
        {

            // only need to fetch once so use single event

            ref.child("Device1").child("state").observeSingleEvent(of: .value, with: { snapshot in
                
                if(snapshot.value! as! Int == 0)
                {
                    self.btnOuter1.isHidden = false
                    self.btnInner1.isHidden = false
                    self.imgDev1.isHidden = false
                    self.stsDev1.isHidden = false
                    self.nameDev1.isHidden = false
                    self.btnInner1.alpha = 0.4
                    self.stsDev1.text = "OFF"
                }
                else
                {
                    self.btnOuter1.isHidden = false
                    self.btnInner1.isHidden = false
                    self.imgDev1.isHidden = false
                    self.stsDev1.isHidden = false
                    self.nameDev1.isHidden = false
                    self.btnInner1.alpha = 1.0
                    self.stsDev1.text = "ON"
                }

                // can also use
                // snapshot.childSnapshotForPath("full_name").value as! String
            })
        }
        
        
        if(storage.bool(forKey: "Dev2Connected"))
        {

            // only need to fetch once so use single event

            ref.child("Device2").child("state").observeSingleEvent(of: .value, with: { snapshot in
                
                if(snapshot.value! as! Int == 0)
                {
                    self.btnOuter2.isHidden = false
                    self.btnInner2.isHidden = false
                    self.imgDev2.isHidden = false
                    self.stsDev2.isHidden = false
                    self.nameDev2.isHidden = false
                    self.btnInner2.alpha = 0.4
                    self.stsDev2.text = "OFF"
                }
                else
                {
                    self.btnOuter2.isHidden = false
                    self.btnInner2.isHidden = false
                    self.imgDev2.isHidden = false
                    self.stsDev2.isHidden = false
                    self.nameDev2.isHidden = false
                    self.btnInner2.alpha = 1.0
                    self.stsDev2.text = "ON"
                }

                // can also use
                // snapshot.childSnapshotForPath("full_name").value as! String
            })
        }
        
        
        if(storage.bool(forKey: "Dev3Connected"))
        {

            // only need to fetch once so use single event

            ref.child("Device3").child("state").observeSingleEvent(of: .value, with: { snapshot in
                
                if(snapshot.value! as! Int == 0)
                {
                    self.btnOuter3.isHidden = false
                    self.btnInner3.isHidden = false
                    self.imgDev3.isHidden = false
                    self.stsDev3.isHidden = false
                    self.nameDev3.isHidden = false
                    self.btnInner3.alpha = 0.4
                    self.stsDev3.text = "OPEN"
                }
                else
                {
                    self.btnOuter3.isHidden = false
                    self.btnInner3.isHidden = false
                    self.imgDev3.isHidden = false
                    self.stsDev3.isHidden = false
                    self.nameDev3.isHidden = false
                    self.btnInner3.alpha = 1.0
                    self.stsDev3.text = "LOCKED"
                }

                // can also use
                // snapshot.childSnapshotForPath("full_name").value as! String
            })
        }
        
        
        if(storage.bool(forKey: "Dev4Connected"))
        {

            // only need to fetch once so use single event

            ref.child("Device4").child("state").observeSingleEvent(of: .value, with: { snapshot in
                
                if(snapshot.value! as! Int == 0)
                {
                    self.btnOuter4.isHidden = false
                    self.btnInner4.isHidden = false
                    self.imgDev4.isHidden = false
                    self.stsDev4.isHidden = false
                    self.nameDev4.isHidden = false
                    self.btnInner4.alpha = 0.4
                    self.stsDev4.text = "READY"
                }
                else
                {
                    self.btnOuter4.isHidden = false
                    self.btnInner4.isHidden = false
                    self.imgDev4.isHidden = false
                    self.stsDev4.isHidden = false
                    self.nameDev4.isHidden = false
                    self.btnInner4.alpha = 1.0
                    self.stsDev4.text = "PRESS"
                }

                // can also use
                // snapshot.childSnapshotForPath("full_name").value as! String
            })
        }

        
        _ = Database.database().reference(withPath: "Device1").child("connected").observe(DataEventType.value, with: { (snapshot) in
                if(snapshot.value! as! Int == 1)
                {
                    self.btnOuter1.isHidden = false
                    self.btnInner1.isHidden = false
                    self.imgDev1.isHidden = false
                    self.stsDev1.isHidden = false
                    self.nameDev1.isHidden = false
                    self.storage.set(true, forKey: "Dev1Connected")
                }
            }
        );
        _ = Database.database().reference(withPath: "Device2").child("connected").observe(DataEventType.value, with: { (snapshot) in
                if(snapshot.value! as! Int == 1)
                {
                    self.btnOuter2.isHidden = false
                    self.btnInner2.isHidden = false
                    self.imgDev2.isHidden = false
                    self.stsDev2.isHidden = false
                    self.nameDev2.isHidden = false
                    self.storage.set(true, forKey: "Dev2Connected")
                }
            }
        );
        _ = Database.database().reference(withPath: "Device3").child("connected").observe(DataEventType.value, with: { (snapshot) in
                if(snapshot.value! as! Int == 1)
                {
                    self.btnOuter3.isHidden = false
                    self.btnInner3.isHidden = false
                    self.imgDev3.isHidden = false
                    self.stsDev3.isHidden = false
                    self.nameDev3.isHidden = false
                    self.storage.set(true, forKey: "Dev3Connected")
                }
            }
        );
        
        _ = Database.database().reference(withPath: "Device4").child("connected").observe(DataEventType.value, with: { (snapshot) in
                if(snapshot.value! as! Int == 1)
                {
                    self.btnOuter4.isHidden = false
                    self.btnInner4.isHidden = false
                    self.imgDev4.isHidden = false
                    self.stsDev4.isHidden = false
                    self.nameDev4.isHidden = false
                    self.storage.set(true, forKey: "Dev4Connected")
                }
            }
        );
        
        
        
        
        _ = Database.database().reference(withPath: "Device1").child("state").observe(DataEventType.value, with: { (snapshot) in
                if(snapshot.value! as! Int == 1)
                {
                    self.stsDev1.text = "ON"
                    self.btnInner1.alpha = 1.0
                }
                else
                {
                    self.stsDev1.text = "OFF"
                    self.btnInner1.alpha = 0.4
                }
            }
        );
        
        _ = Database.database().reference(withPath: "Device2").child("state").observe(DataEventType.value, with: { (snapshot) in
                if(snapshot.value! as! Int == 1)
                {
                    self.stsDev2.text = "ON"
                    self.btnInner2.alpha = 1.0
                }
                else
                {
                    self.stsDev2.text = "OFF"
                    self.btnInner2.alpha = 0.4
                }
            }
        );
        
        _ = Database.database().reference(withPath: "Device3").child("state").observe(DataEventType.value, with: { (snapshot) in
                if(snapshot.value! as! Int == 1)
                {
                    self.stsDev3.text = "LOCKED"
                    self.btnInner3.alpha = 1.0
                }
                else
                {
                    self.stsDev3.text = "OPEN"
                    self.btnInner3.alpha = 0.4
                }
            }
        );
        
        _ = Database.database().reference(withPath: "Device4").child("state").observe(DataEventType.value, with: { (snapshot) in
                if(snapshot.value! as! Int == 1)
                {
                    let ref = Database.database().reference()
                    let userRef = ref.child("Device4")
                userRef.updateChildValues(["state":0])
                    self.stsDev4.text = "PRESS"
                    self.btnInner4.alpha = 1.0
                    let alertController = UIAlertController(title: "Hey, Check Your Door!", message:
                        "Someone rang your doorbell! Check it out!", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                    self.stsDev4.text = "READY"
                    self.btnInner4.alpha = 0.4
                }
                else
                {
                    self.stsDev4.text = "READY"
                    self.btnInner4.alpha = 0.4
                }
            }
        );


        
        // Do any additional setup after loading the view.
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
