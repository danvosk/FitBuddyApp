//
//  PplWorkoutsViewController.swift
//  FitBuddyApp
//
//  Created by Görkem Karagöz on 20.05.2024.
//

import UIKit

class PplWorkoutsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var pplworkoutsTableView: UITableView!
    var workoutType: String?
    
    var workouts = [Workouts]()
    var chosenWorkout: Workouts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pplworkoutsTableView.delegate = self
        pplworkoutsTableView.dataSource = self
        
        // workoutType kullanarak gerekli işlemleri yapabilirsiniz
        if let workoutType = workoutType {
            print("Selected workout type: \(workoutType)")
            // Örneğin, seçilen antrenman türüne göre gerekli işlemleri yapabilirsiniz
        }
        
        // Sadece istenen egzersizlerin adlarını içeren bir dizi oluşturun
        switch workoutType {
        case "Push":
            let workoutone = Workouts(workoutsName: "Dumbell Incline Chest Press", workoutsDescription: "Üst göğüs odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "dumbellinclinechestpress")!)
            let workouttwo = Workouts(workoutsName: "Chest Fly Machine", workoutsDescription: "Genel göğüs odaklı 4-5 set 10-15 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "flymachine")!)
            let workoutsix = Workouts(workoutsName: "Rope Push Down", workoutsDescription: "Arka kol odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "ropepushdown")!)
            let workoutseven = Workouts(workoutsName: "Skullcrusher", workoutsDescription: "Arka kol odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "skullcrusher")!)
            let workouteight = Workouts(workoutsName: "Shoulder Press Machine", workoutsDescription: "Omuz odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "shoulderpressmachine")!)
            workouts = [workoutone, workouttwo, workoutsix, workoutseven, workouteight]
        case "Pull":
            let workoutthree = Workouts(workoutsName: "Lat Pull Down", workoutsDescription: "Sırt odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "latpulldown")!)
            let workoutfour = Workouts(workoutsName: "T-Bar Row", workoutsDescription: "Sırt odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "tbarrow")!)
            let workoutfive = Workouts(workoutsName: "Dumbell Hummel Curl", workoutsDescription: "Biceps ve ön kol odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "dumbellhummelcurl")!)
            workouts = [workoutthree, workoutfour, workoutfive]
        case "Leg":
            let workoutnine = Workouts(workoutsName: "Leg Extension", workoutsDescription: "Ön bacak odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "legextension")!)
            let workoutten = Workouts(workoutsName: "Leg Curl", workoutsDescription: "Arka bacak odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "legcurl")!)
            workouts = [workoutnine, workoutten]
        default:
            workouts = []
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let workout = workouts[indexPath.row]
        cell.textLabel?.text = workout.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenWorkout = workouts[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsvc", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsvc" {
            guard let destinationVC = segue.destination as? DetailsVC else {
                fatalError("Destination is not a DetailsVC!")
            }
            destinationVC.selectedWorkouts = chosenWorkout
        }
    }
}
