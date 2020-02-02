//
//  RGBSettingsViewController.swift
//  Home Control
//
//  Created by Wania Shams on 01/02/2020.
//  Copyright © 2020 Araad Shams. All rights reserved.
//

import UIKit
import Firebase

class RGBSettingsViewController: UIViewController {

    var r = 0
    var g = 0
    var b = 0
    
    
    @IBOutlet weak var RSlider: UISlider!
    @IBOutlet weak var GSlider: UISlider!
    @IBOutlet weak var BSlider: UISlider!
    @IBOutlet weak var ViewColor: UIView!
    @IBOutlet weak var OKButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference() // your ref ie. root.child("users").child("stephenwarren001@yahoo.com
        ref.child("Device2").child("Red").observeSingleEvent(of: .value, with: { snapshot in
            self.r = snapshot.value! as! Int
            self.ViewColor.backgroundColor = UIColor.init(red: CGFloat(self.r/255), green: CGFloat(self.g/255), blue: CGFloat(self.b/255), alpha: 1.0)
            })
        ref.child("Device2").child("Green").observeSingleEvent(of: .value, with: { snapshot in
            self.g = snapshot.value! as! Int
            self.ViewColor.backgroundColor = UIColor.init(red: CGFloat(self.r/255), green: CGFloat(self.g/255), blue: CGFloat(self.b/255), alpha: 1.0)
            })
        ref.child("Device2").child("Blue").observeSingleEvent(of: .value, with: { snapshot in
            self.b = snapshot.value! as! Int
            self.ViewColor.backgroundColor = UIColor.init(red: CGFloat(Double(self.r)/255.0), green: CGFloat(Double(self.g)/255.0), blue: CGFloat(Double(self.b)/255.0), alpha: 1.0)
            })
        

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func redChanged(_ sender: Any) {

        r = Int(RSlider.value)
        ViewColor.backgroundColor = UIColor.init(red: CGFloat(Double(r)/255.0), green: CGFloat(Double(g)/255.0), blue: CGFloat(Double(b)/255.0), alpha: 1.0)
    }
    @IBAction func greenChanged(_ sender: Any) {

        g = Int(GSlider.value)
        ViewColor.backgroundColor = UIColor.init(red: CGFloat(Double(r)/255.0), green: CGFloat(Double(g)/255.0), blue: CGFloat(Double(b)/255.0), alpha: 1.0)
    }
    @IBAction func blueChanged(_ sender: Any) {

        b = Int(BSlider.value)
        ViewColor.backgroundColor = UIColor.init(red: CGFloat(Double(r)/255.0), green: CGFloat(Double(g)/255.0), blue: CGFloat(Double(b)/255.0), alpha: 1.0)
    }
    
    
    @IBAction func OKPressed(_ sender: Any) {
        let ref = Database.database().reference()
        let userRef = ref.child("Device2")
        if(r == 0 && b == 0 && g == 0)
        {
            userRef.updateChildValues(["state":0])
        }
        userRef.updateChildValues(["state":1])
        userRef.updateChildValues(["Red":r])
        userRef.updateChildValues(["Green":g])
        userRef.updateChildValues(["Blue":b])
        performSegue(withIdentifier: "goBack", sender: self)

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
