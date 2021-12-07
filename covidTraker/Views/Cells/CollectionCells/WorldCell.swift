//
//  CountryCell.swift
//  covidTraker
//
//  Created by Paul Ghibeaux on 21/11/2021.
//

import UIKit
import Charts

class WorldCell: UICollectionViewCell {

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
        self.totalCovidCases.text =  "Total Covid Cases 🦠 \(dayData.totalCasesText)"
        self.totalRecovered.text =  "Total Recovered 💉 \(dayData.totalRecoveredText)"
        self.totalDeaths.text = "Total Deaths 🪦 \(dayData.totalDeathsText)"
        self.newCases.text = " New cases 😷 \(dayData.newCasesText)"
        self.updatedAt.text = " Updated at ⏱ : \(dayData.lastUpdate)"
        
        
        
        createGraph()
        
//
     }
       
    
    
    
    
    
    
    private func createGraph() {
      
        let headerview = self.chartView
        
        let set = self.dayData!
        var entries : [ChartDataEntry] = []
        entries.append(.init(x: Double(dayData.totalCasesText) ?? 10.0, y: Double(set.newDeathsText) ?? 10.0 ))

        let dataSet = LineChartDataSet(entries: entries, label: "Covid cases")
        // Chart colors template
        dataSet.colors = ChartColorTemplates.colorful()
        dataSet.mode = .cubicBezier
        dataSet.lineWidth = 2
        dataSet.circleRadius = 4
        dataSet.setCircleColor(.black)
    
        dataSet.fillAlpha = 1
       
        let data: LineChartData = LineChartData(dataSet: dataSet)
        // Chart view with a frame
        
        let chart = LineChartView(frame: CGRect(x: 0, y: 10, width: chartView.frame.size.width, height: chartView.frame.size.width))
        chart.rightAxis.enabled = false
        chart.data = data
        // subviews
       
        headerview!.addSubview(chart)

    }
    

}
