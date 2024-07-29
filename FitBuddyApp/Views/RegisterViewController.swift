//
//  RegisterViewController.swift
//  FitBuddyApp
//
//  Created by Görkem Karagöz on 3.05.2024.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    

    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Metin alanlarına dokunulduğunda klavyeyi kapatmak için UITapGestureRecognizer oluştur
             let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
             view.addGestureRecognizer(tapGesture)
    }
    
    // Klavyeyi kapat
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    
    @IBAction func registerButtonn(_ sender: Any) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let managedContext = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
            let user = NSManagedObject(entity: entity, insertInto: managedContext)
            
            // Kullanıcı bilgilerini al
            if let name = nameTextField.text,
               let surname = surnameTextField.text,
               let ageString = ageTextField.text,
               let age = Int(ageString),
               let heightString = heightTextField.text,
               let height = Double(heightString),
               let weightString = weightTextField.text,
               let weight = Double(weightString),
               let username = usernameTextField.text,
               let passwordString = passwordTextField.text,
               let password = Int(passwordString) {
                
                // Kullanıcı özelliklerini ayarla
                user.setValue(name, forKey: "name")
                user.setValue(surname, forKey: "surname")
                user.setValue(age, forKey: "age")
                user.setValue(height, forKey: "height")
                user.setValue(weight, forKey: "weight")
                user.setValue(username, forKey: "username")
                user.setValue(password, forKey: "password")
                
                // Veriyi kaydet
                do {
                    try managedContext.save()
                    print("User saved.")
                    // Kullanıcıya başarı mesajını göster
                    showSuccessAlert()
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            } else {
                // Hata durumunu ele al veya kullanıcıya uygun bir hata mesajı göster
                print("Invalid input data.")
                showIncompleteInputAlert()
            }
        }
    }
    
    func showSuccessAlert() {
           let alertController = UIAlertController(title: "BAŞARILI!", message: "Kayıt işlemi başarıyla tamamlandı.", preferredStyle: .alert)
           alertController.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { _ in
               // "Tamam" düğmesine basıldığında geri dönüş yap
               self.navigationController?.popViewController(animated: true)
           }))
           present(alertController, animated: true, completion: nil)
       }
    
    func showIncompleteInputAlert() {
           let alertController = UIAlertController(title: "BAŞARISIZ!", message: "Lütfen tüm bilgileri girin.", preferredStyle: .alert)
           alertController.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
           present(alertController, animated: true, completion: nil)
       }
}
