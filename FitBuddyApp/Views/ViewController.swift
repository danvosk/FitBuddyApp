//
//  ViewController.swift
//  FitBuddyApp
//
//  Created by Görkem Karagöz on 3.05.2024.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Text field'ların delegelerini ViewController olarak ayarla
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // Klavye "return" tuşuna basıldığında çağrılır
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Eğer kullanıcı adı alanındaysa, şifre alanına geç
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            // Şifre alanındaysa klavyeyi kapat
            textField.resignFirstResponder()
        }
        return true
    }
    
    @IBAction func loginButton(_ sender: Any) {
        // Kullanıcı girişi yap
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let managedContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
            fetchRequest.predicate = NSPredicate(format: "username == %@ AND password == %@", usernameTextField.text ?? "", passwordTextField.text ?? "")
            do {
                let users = try managedContext.fetch(fetchRequest)
                if let user = users.first {
                    // Giriş başarılı olduğunda uyarı göster
                    showSuccessAlert() {
                        // Giriş başarılı olduğunda bir sonraki adıma geç
                        self.performSegue(withIdentifier: "loginVC", sender: nil)
                    }
                    print("Login successful. Welcome, \(user.value(forKey: "username") ?? "")!")
                } else {
                    // Giriş başarısız olduğunda uyarı göster
                    showFailureAlert()
                    print("Login failed. Invalid username or password.")
                }
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        performSegue(withIdentifier:"registerVC", sender: nil)
    }
    
    func showSuccessAlert(completion: @escaping () -> Void) {
        let alertController = UIAlertController(title: "BAŞARILI", message: "Giriş başarılı. Hoş geldiniz!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { _ in
            completion()
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    func showFailureAlert() {
        let alertController = UIAlertController(title: "BAŞARISIZ!", message: "Geçersiz kullanıcı adı veya şifre.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
