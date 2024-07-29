//
//  FullBodyViewController.swift
//  FitBuddyApp
//
//  Created by Görkem Karagöz on 3.05.2024.
//

import UIKit

class FullBodyViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var fullbodyTableView: UITableView!
    
    
    var workouts = [Workouts]()
    var chosenWorkout : Workouts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullbodyTableView.delegate = self
        fullbodyTableView.dataSource = self

        
        //Workout Objects
        let workoutone = Workouts(workoutsName: "Dumbell Incline Chest Press", workoutsDescription: "Üst göğüs odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "dumbellinclinechestpress")!)
        let workouttwo = Workouts(workoutsName: "Chest Fly Machine", workoutsDescription: "Genel göğüs odaklı 4-5 set 10-15 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "flymachine")!)
        let workoutthree = Workouts(workoutsName: "Lat Pull Down", workoutsDescription: "Sırt odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "latpulldown")!)
        let workoutfour = Workouts(workoutsName: "T-Bar Row", workoutsDescription: "Sırt odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "tbarrow")!)
        let workoutfive = Workouts(workoutsName: "Dumbell Hummel Curl", workoutsDescription: "Biceps ve ön kol odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "dumbellhummelcurl")!)
        let workoutsix = Workouts(workoutsName: "Rope Push Down", workoutsDescription: "Arka kol odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "ropepushdown")!)
        let workoutseven = Workouts(workoutsName: "Skullcrusher", workoutsDescription: "Arka kol odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "skullcrusher")!)
        let workouteight = Workouts(workoutsName: "Shoulder Press Machine", workoutsDescription: "Omuz odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "shoulderpressmachine")!)
        let workoutnine = Workouts(workoutsName: "Leg Extension", workoutsDescription: "Ön bacak odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "legextension")!)
        let workoutten = Workouts(workoutsName: "Leg Curl", workoutsDescription: "Arka bacak odaklı 3-4 set 8-12 tekrar yapılabilir bir harekettir", workoutsImage:UIImage(named: "legcurl")!)
        
        workouts.append(workoutone)
        workouts.append(workouttwo)
        workouts.append(workoutthree)
        workouts.append(workoutfour)
        workouts.append(workoutfive)
        workouts.append(workoutsix)
        workouts.append(workoutseven)
        workouts.append(workouteight)
        workouts.append(workoutnine)
        workouts.append(workoutten)
}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell()
        // cell.textLabel?.text = "test"
        var content = cell.defaultContentConfiguration()
        content.text = workouts[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
         
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenWorkout = workouts[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedWorkouts = chosenWorkout
        }
    }
    }

