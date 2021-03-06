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
        self.wordSituation.text = " World Situation ð "
        self.totalCovidCases.text =  "Total Covid Cases ðĶ  \(dayData.totalCasesText)"
        self.totalRecovered.text =  "Total Recovered ð \(dayData.totalRecoveredText)"
        self.totalDeaths.text = "Total Deaths ðŠĶ \(dayData.totalDeathsText)"
        self.newCases.text = " New cases ð· \(dayData.newCasesText)"
        self.updatedAt.text = " Updated at âą : \(dayData.lastUpdate)"
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        self.createGraph()
//
        guard let location = manager.location else {
            return
        }
        self.saveLocation(location)
     }
    
    func saveLocation(_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let user_lat = String(format: "%f", coordinate.latitude)
        UserDefaults.standard.set(user_lat, forKey: "latitude")
        let user_long = String(format: "%f", coordinate.longitude)        
        UserDefaults.standard.set(user_long, forKey: "longitude")

    }
       
    private func createGraph() {
      
        let headerview = self.chartView
        var entries : [ChartDataEntry] = [ChartDataEntry(x: 0, y: 0)]
        entries.append(ChartDataEntry(x: (dayData.newCasesText as NSString).doubleValue, y: (dayData.newCasesText as NSString).doubleValue))
   
        let dataSet = LineChartDataSet(entries: entries, label: "Covid cases")
        // Chart colors template
        dataSet.colors = ChartColorTemplates.colorful()
        dataSet.mode = .horizontalBezier
        dataSet.lineWidth = 3
        dataSet.circleRadius = 7
        dataSet.setCircleColor(.systemRed)
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

