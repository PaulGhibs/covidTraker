//
//  labelCell.swift
//  covidTraker
//
//  Created by Paul Ghb on 06/12/2021.
//

import UIKit
import Charts

class labelCell: UITableViewCell {

    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var totalCovidCases: UILabel!
    
    @IBOutlet weak var totalRecovered: UILabel!
    @IBOutlet weak var totalDeaths: UILabel!
    
    @IBOutlet weak var newCases: UILabel!
   
    @IBOutlet weak var countryName: UILabel!

    
    
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
    
    private var dayData = [CovidCollection]()
    
    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
           guard let cellVM = cellViewModel as? ResultCellViewModel else {
               return
           }
        
        self.dayData.append(cellVM.covidCollection!)
        
        for covidInfos in self.dayData {
            cellVM.covidCollection = covidInfos
            self.totalCovidCases.text =  "Total Covid Cases 🦠 \(covidInfos.totalCasesText)"
            self.totalRecovered.text =  "Total Recovered 💉 \(covidInfos.totalRecoveredText)"
            self.totalDeaths.text = "Total Deaths 🪦 \(covidInfos.totalDeathsText)"
            self.newCases.text = " New cases 😷 \(covidInfos.newCasesText)"
         
            
            self.countryName.text = " Country : \(covidInfos.countryText)"
        }
        
 
        
        self.createGraph()
//
     }
    
    private func createGraph() {
      
        let headerview = self.chartView
        
        let set = self.dayData
        var entries : [ChartDataEntry] = [ChartDataEntry(x: 0, y: 10), ChartDataEntry(x: 1, y: 5.0), ChartDataEntry(x: 2, y: 7.0), ChartDataEntry(x: 3, y: 6.0), ChartDataEntry(x: 4, y: 16.0)]

       
        
        for index in set {
            entries.append(.init(x: Double(index.activeCasesText) ?? 0, y: Double(index.totalCasesText) ?? 0))
        }
        let dataSet = LineChartDataSet(entries: entries, label: "Covid cases")
        // Chart colors template
        dataSet.colors = ChartColorTemplates.colorful()
        dataSet.mode = .horizontalBezier
        dataSet.lineWidth = 5
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
