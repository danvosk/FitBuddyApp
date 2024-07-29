//
//  Workouts.swift
//  FitBuddyApp
//
//  Created by Görkem Karagöz on 20.05.2024.
//

import Foundation
import UIKit

class Workouts {

    var name : String
    var description : String
    var image : UIImage

    
    init(workoutsName: String, workoutsDescription: String, workoutsImage: UIImage) {
        self.name = workoutsName
        self.description = workoutsDescription
        self.image = workoutsImage
    }
    
}

