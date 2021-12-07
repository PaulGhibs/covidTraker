//
//  SearchCell.swift
//  covidTraker
//
//  Created by Paul Ghb on 06/12/2021.
//

import UIKit
import MapKit
import CoreLocation


class CountryCell: UITableViewCell, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @IBOutlet weak var searchMap: MKMapView!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    static let numberFormatter: NumberFormatter = {
        let formater = NumberFormatter()
        formater.locale = .current
        formater.formatterBehavior = .default
        formater.usesGroupingSeparator = true
        formater.groupingSeparator = ","
        
        
        return formater
    }()
    
    override func layoutSubviews() {
        searchMap.layer.cornerRadius = 20
        searchMap.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        locationLabel.textDropShadow()
          
    }
    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let cellVM = cellViewModel as? CountryCellViewModel else {
               return
           }
       
        manager.startUpdatingLocation()
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest // battery s
        self.locationLabel.isHidden = true
  
     }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            render(location)
        }
    }
    
    func render(_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        location.placemark { placemark, error in
            guard let placemark = placemark else {
                print("Error:", error ?? "nil")
                return
            }
            
            self.locationLabel.isHidden = false
            self.locationLabel.text = "You have been 📍 at this adress : \(placemark.postalAddressFormatted ?? "")"
           
            if placemark == placemark {
               _ = placemark.country?.replacingOccurrences(of: "United States", with: "USA")
            }
            ResultViewModel.countryChoosen = placemark.country ?? ""
            print(placemark.country ?? "")
            
            
        }
        
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        searchMap.setRegion(region, animated: true)
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        searchMap.addAnnotation(pin)
    }
    
}
