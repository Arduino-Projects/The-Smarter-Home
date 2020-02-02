//
//  AIViewController.swift
//  Home Control
//
//  Created by Wania Shams on 01/02/2020.
//  Copyright © 2020 Araad Shams. All rights reserved.
//

import UIKit

class AIViewController: UIViewController {
    var firstNum = 0
    var secondNum = 0
    var titles = [String]()
    var descs = [String]()
    var storage = UserDefaults.standard
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var desc1: UILabel!
    @IBOutlet weak var desc2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titles.append(". Turn Off Light When Not Home")
        titles.append(". Use Less AC")
        titles.append(". Insulate Windows and Doors")
        titles.append(". Use More Efficient Appliances")
        
        descs.append("When you are not home, turn off all your lights. Home Control has detected that many lights stay on when no movemnet is detected")
        descs.append("During moderate weather, the temperature meter has detected that you tend to use low temperatures. Using AC uses a lot of energy")
        descs.append("A lot of your temperatures between devices appear to be fluttering. Try to insulate your walls and windows in order to maintain temperatures and pay less")
        descs.append("The outlet device have detected that your high voltage electronics are using a lot of power. It is reccomended that you use more energy efficient devices")

        // Do any additional setup after loading the view.
        title1.text = "1" + titles[storage.value(forKey: "k1") as! Int]
                title2.text = "2" + titles[storage.value(forKey: "k2") as! Int]
                desc1.text = descs[storage.value(forKey: "k1") as! Int]
                        desc2.text = descs[storage.value(forKey: "k2") as! Int]
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
