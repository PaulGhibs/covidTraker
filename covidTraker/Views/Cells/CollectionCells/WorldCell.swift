//
//  CountryCell.swift
//  covidTraker
//
//  Created by Paul Ghibeaux on 21/11/2021.
//

import UIKit
import Charts
import CoreLocation

class WorldCell: UICollectionViewCell, CLLocationManagerDelegate {

    let manager = CLLocationManager()
    
    var tempsLocations = [Coordinates]()

    @IBOutlet weak var wordSituation: UILabel!
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var totalCovidCases: UILabel!
    @IBOutlet weak var totalRecovered: UILabel!
    @IBOutlet weak var totalDeaths: UILabel!
    
    @IBOutlet weak var newCases: UILabel!
    @IBOutlet weak var updatedAt: UILabel!
    
    private var dayData: CovidCollection!

    
    override func layoutSubviews() {
        super.layoutSubviews()
        totalCovidCases.textDropShadow()
        totalRecovered.textDropShadow()
        totalDeaths.textDropShadow()
        newCases.textDropShadow()
        chartView.layer.cornerRadius = 12
        chartView.layer.borderColor = UIColor.lightGray.cgColor
        chartView.layer.backgroundColor = UIColor.white.cgColor
        chartView.layer.masksToBounds = false
        chartView.layer.shadowRadius = 3.0
        chartView.layer.shadowOpacity = 0.3
        chartView.layer.shadowColor = UIColor.black.cgColor
        chartView.layer.shadowOffset = CGSize(width: 2, height: 2)
    }
    
    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
           guard let cellVM = cellViewModel as? WorldCellViewModel else {
               return
           }
        self.dayData = cellVM.covidCollection
        self.wordSituation.text = " World Situation 🌍 "
        self.totalCovidCases.text =  "Total Covid Cases 🦠 \(dayData.totalCasesText)"
        self.totalRecovered.text =  "Total Recovered 💉 \(dayData.totalRecoveredText)"
        self.totalDeaths.text = "Total Deaths 🪦 \(dayData.totalDeathsText)"
        self.newCases.text = " New cases 😷 \(dayData.newCasesText)"
        self.updatedAt.text = " Updated at ⏱ : \(dayData.lastUpdate)"
        
        
        
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        self.saveLocation(manager.location!)
        self.createGraph()

//
     }
    
    func saveLocation(_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let user_lat = String(format: "%f", coordinate.latitude)
        let user_long = String(format: "%f", coordinate.longitude)
        let coordinatesSaved = Coordinates.init(latitude: user_lat, longitude: user_long)
        tempsLocations.append(coordinatesSaved)
        NotificationCenter.default.post(name: .newCoordinatesPost, object: tempsLocations)
        
    }
       
  
    
    
   
    
    
    private func createGraph() {
      
        let headerview = self.chartView
        var entries : [ChartDataEntry] = [ChartDataEntry(x: 0, y: 0)]
        entries.append(ChartDataEntry(x: (dayData.newCasesText as NSString).doubleValue, y: (dayData.newCasesText as NSString).doubleValue))
   
        let dataSet = LineChartDataSet(entries: entries, label: "Covid cases")
        // Chart colors template
        dataSet.colors = ChartColorTemplates.colorful()
        dataSet.mode = .horizontalBezier
        dataSet.lineWidth = 1
        dataSet.circleRadius = 4
        dataSet.setCircleColor(.black)
    
        dataSet.fillAlpha = 1
       
        let data: LineChartData = LineChartData(dataSet: dataSet)
        // Chart view with a frame
        
        let chart = LineChartView(frame: CGRect(x: 0, y: 10, width: chartView.frame.size.width, height: chartView.frame.size.width))
        chart.rightAxis.enabled = false
        chart.leftAxis.enabled = false
        chart.data = data
        // subviews
       
        headerview!.addSubview(chart)

    }
    

}

extension Notification.Name {
    static let newCoordinatesPost = Notification.Name("new_coordinates_post")
}
