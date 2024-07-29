//
//  SplitViewController.swift
//  FitBuddyApp
//
//  Created by Görkem Karagöz on 3.05.2024.
//

import UIKit

class SplitViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var splitTableView: UITableView!
    
    let days = ["1.GÜN","2.GÜN","3.GÜN","4.GÜN"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitTableView.register(UITableViewCell.self, forCellReuseIdentifier: "daycells")
        
        splitTableView.dataSource = self
        splitTableView.delegate = self
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "daycells", for: indexPath)
                
                // Hücrenin metnini antrenman hareketlerine göre güncelliyoruz
                cell.textLabel?.text = days[indexPath.row]
                
                return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Seçilen hücrenin dizinini kontrol edin ve uygun işlemi yapın
        switch indexPath.row {
        case 0:
            // 1.GÜN seçeneğine tıklandığında PplWorkoutsViewController'a geçiş yap
            performSegue(withIdentifier: "toSplitWorkouts", sender: "1.GÜN")
        case 1:
            // 2.GÜN seçeneğine tıklandığında PplWorkoutsViewController'a geçiş yap
            performSegue(withIdentifier: "toSplitWorkouts", sender: "2.GÜN")
        case 2:
            // 3.GÜN seçeneğine tıklandığında PplWorkoutsViewController'a geçiş yap
            performSegue(withIdentifier: "toSplitWorkouts", sender: "3.GÜN")
        case 3:
            // 4.GÜN seçeneğine tıklandığında PplWorkoutsViewController'a geçiş yap
            performSegue(withIdentifier: "toSplitWorkouts", sender: "4.GÜN")
            
        default:
            break
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSplitWorkouts" {
            // Hedef view controller'ı alın
            if let destinationVC = segue.destination as? SplitWorkoutsViewController {
                // Sender'a göre uygun veriyi aktarın
                if let workoutType = sender as? String {
                    destinationVC.workoutType = workoutType
                }
            }
        }
    }

}
