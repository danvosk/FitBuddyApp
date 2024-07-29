//
//  GymListViewController.swift
//  FitBuddyApp
//
//  Created by Görkem Karagöz on 20.05.2024.
//
import UIKit

class GymListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var gymlistTableView: UITableView!
    
    var gymNames = ["Fitness First", "Golds Gym", "24 Hour Fitness", "Anytime Fitness", "Equinox"]
    var gymCities = ["İstanbul", "New York", "Los Angeles", "Sydney", "London"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gymlistTableView.register(UITableViewCell.self, forCellReuseIdentifier: "gymcells")
        
        gymlistTableView.delegate = self
        gymlistTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Seçilen spor salonunun adını ve şehrini diğer sayfaya aktar
        let selectedGymName = gymNames[indexPath.row]
        let selectedGymCity = gymCities[indexPath.row]
        performSegue(withIdentifier: "gymVC", sender: (selectedGymName, selectedGymCity)) // İlgili bilgileri sender olarak iletiyoruz
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gymNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gymcells", for: indexPath)
        cell.textLabel?.text = gymNames[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gymVC" {
            if let destinationVC = segue.destination as? GymViewController {
                // Göndericiyi çöz ve veriyi al
                if let (selectedGymName, selectedGymCity) = sender as? (String, String) {
                    // GymViewController'a seçilen spor salonunun adını ve şehrini aktar
                    destinationVC.selectedGymName = selectedGymName
                    destinationVC.selectedGymCity = selectedGymCity
                }
            }
        }
    }
}
