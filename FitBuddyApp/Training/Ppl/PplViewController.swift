//
//  PplViewController.swift
//  FitBuddyApp
//
//  Created by Görkem Karagöz on 3.05.2024.
//

import UIKit

class PplViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var pplTableView: UITableView!
    
    let pplworkouts = ["Push","Pull","Leg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        pplTableView.register(UITableViewCell.self, forCellReuseIdentifier: "daycells")
        
        pplTableView.dataSource = self
        pplTableView.delegate = self
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pplworkouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "daycells", for: indexPath)
                
        // Hücrenin metnini antrenman hareketlerine göre güncelliyoruz
        cell.textLabel?.text = pplworkouts[indexPath.row]
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Seçilen hücrenin dizinini kontrol edin ve uygun işlemi yapın
        switch indexPath.row {
        case 0:
            // Push seçeneğine tıklandığında PplWorkoutsViewController'a geçiş yap
            performSegue(withIdentifier: "toPplWorkouts", sender: "Push")
        case 1:
            // Pull seçeneğine tıklandığında PplWorkoutsViewController'a geçiş yap
            performSegue(withIdentifier: "toPplWorkouts", sender: "Pull")
        case 2:
            // Leg seçeneğine tıklandığında PplWorkoutsViewController'a geçiş yap
            performSegue(withIdentifier: "toPplWorkouts", sender: "Leg")
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPplWorkouts" {
            // Hedef view controller'ı alın
            if let destinationVC = segue.destination as? PplWorkoutsViewController {
                // Sender'a göre uygun veriyi aktarın
                if let workoutType = sender as? String {
                    destinationVC.workoutType = workoutType
                }
            }
        }
    }
}
