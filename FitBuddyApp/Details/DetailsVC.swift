//
//  DetailsVC.swift
//  FitBuddyApp
//
//  Created by Görkem Karagöz on 20.05.2024.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var workoutnameLabel: UILabel!
    @IBOutlet weak var workoutdescriptionLabel: UILabel!
    
    var selectedWorkouts : Workouts?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = selectedWorkouts?.image
        workoutnameLabel.text = selectedWorkouts?.name
        workoutdescriptionLabel.text = selectedWorkouts?.description
    }
}
