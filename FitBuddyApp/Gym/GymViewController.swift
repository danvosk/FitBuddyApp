//
//  GymViewController.swift
//  TravelBook
//
//  Created by Görkem Karagöz on 5.05.2024.
//
//
//  GymViewController.swift
//  TravelBook
//
//  Created by Görkem Karagöz on 5.05.2024.
import UIKit
import MapKit
import SafariServices

class GymViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var gymNameLabel: UILabel!
    @IBOutlet weak var gymCityLabel: UILabel!
    @IBOutlet weak var mapkitView: MKMapView!
    
    var selectedGymName = ""
    var selectedGymCity = ""
    var selectedGymLocation: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Seçilen spor salonunun adını ve şehrini ekranda göster
        gymNameLabel.text = selectedGymName
        gymCityLabel.text = selectedGymCity
        
        // Harita yapısını yapılandır
        mapkitView.delegate = self
        
        // Seçilen spor salonunun konumunu haritada göster
        showSelectedGymLocationOnMap()
    }
    
    func showSelectedGymLocationOnMap() {
        // Spor salonunun adı ve şehrinden koordinatları al
        guard let location = getLocationForGym(name: selectedGymName, city: selectedGymCity) else {
            return
        }
        selectedGymLocation = location
        
        // Koordinatları işaretlemek için bir işaretçi oluştur
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = selectedGymName
        annotation.subtitle = selectedGymCity
        
        // Haritaya işaretçiyi ekle
        mapkitView.addAnnotation(annotation)
        
        // Haritayı seçilen konuma odakla
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapkitView.setRegion(region, animated: true)
    }
    
    func getLocationForGym(name: String, city: String) -> CLLocationCoordinate2D? {
        // Spor salonunun adı ve şehrine göre koordinatları belirle
        // Bu örnekte sabit koordinatlar kullanılıyor, gerçek uygulamada bir veritabanından veya harici bir hizmetten alınabilir
        switch (name, city) {
        case ("Fitness First", "İstanbul"):
            return CLLocationCoordinate2D(latitude: 41.0055, longitude: 28.9769)
        case ("Golds Gym", "New York"):
            return CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)
        case ("24 Hour Fitness", "Los Angeles"):
            return CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437)
        case ("Anytime Fitness", "Sydney"):
            return CLLocationCoordinate2D(latitude: -33.8688, longitude: 151.2093)
        case ("Equinox", "London"):
            return CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1278)
        default:
            return nil
        }
    }
    
    // MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        // Kullanıcıya bir uyarı göster
        let alert = UIAlertController(title: "Yol Tarifi Al", message: "Seçili konuma yol tarifi almak istiyor musunuz?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Evet", style: .default) { _ in
            self.provideDirections()
        })
        alert.addAction(UIAlertAction(title: "Hayır", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        // Seçimi kaldır
        mapView.deselectAnnotation(view.annotation, animated: true)
    }
    func provideDirections() {
        // Kullanıcının konumunu al
        guard let gymLocation = selectedGymLocation else {
            return
        }
        
        // Apple Haritalar uygulamasına yönlendirmek için bir metin bağlantısı oluştur
        let message = "Apple Haritalar uygulamasında yol tarifi almak için lütfen bu bağlantıya tıklayın: Apple Haritalar"
        
        // UIAlertController oluştur
        let alert = UIAlertController(title: "Yol Tarifi", message: message, preferredStyle: .alert)
        
        // "Tamam" düğmesini ekle
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { _ in
            // Apple Haritalar uygulamasını açmak için URL'yi aç
            if let url = URL(string: "http://maps.apple.com/?daddr=\(gymLocation.latitude),\(gymLocation.longitude)&dirflg=d") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        
        // UIAlertController'ı göster
        present(alert, animated: true, completion: nil)
    }


}
