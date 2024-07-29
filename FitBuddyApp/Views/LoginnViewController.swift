//
//  LoginnViewController.swift
//  FitBuddyApp
//
//  Created by Görkem Karagöz on 3.05.2024.
//

import UIKit

class LoginnViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    @IBAction func fullbodyButton(_ sender: Any) {
        performSegue(withIdentifier: "fullbodyVC", sender: nil)
    }
    @IBAction func splitButton(_ sender: Any) {
        performSegue(withIdentifier: "splitVC", sender: nil)
    }
    @IBAction func pplButton(_ sender: Any) {
        performSegue(withIdentifier: "pplVC", sender: nil)
    }
   
    @IBAction func fitnesscentersButton(_ sender: Any) {
        performSegue(withIdentifier: "gymlistVC", sender: nil)

    }
}
