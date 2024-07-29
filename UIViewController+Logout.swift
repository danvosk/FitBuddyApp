import UIKit
import CoreData

extension UIViewController {
    func addLogoutButton() {
        let logoutButton = UIBarButtonItem(title: "Çıkış", style: .plain, target: self, action: #selector(logoutTapped))
        self.navigationItem.rightBarButtonItem = logoutButton
    }
    
    @objc private func logoutTapped() {
        // Kullanıcıyı CoreData'dan çıkış yap
        CoreDataManager.shared.logoutUser()
        
        // Kullanıcıyı giriş ekranına yönlendir
        navigateToLoginViewController()
    }
    
    private func navigateToLoginViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UINavigationController(rootViewController: loginVC)
            window.makeKeyAndVisible()
        }
    }
}
