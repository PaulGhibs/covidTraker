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
    @IBOutlet weak var firstHeader: UILabel!
    @IBOutlet weak var secondHeader: UILabel!
   
   
    
    @IBOutlet weak var totalRecovered: UILabel!
    
    @IBOutlet weak var updatedAt: UILabel!
    
    private var dayData: CovidCollection!
    
    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
           guard let cellVM = cellViewModel as? WorldCellViewModel else {
               return
           }
        self.dayData = cellVM.covidCollection

        self.firstHeader.text = cellVM.firstHeader
        self.secondHeader.text = cellVM.secondsubtitle
        
       
        self.totalRecovered.text = "Total Deaths : \(dayData.totalDeathsText)"
        
        self.updatedAt.text = "Updated at  : \(dayData.lastUpdate)"
        
        createGraph()
        
//
     }
       
    
    
   
       override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
           // Do something if needed
           guard let routingEntry = cellViewModel.routingEntry,
                 let navController = controller.navigationController else {
               return
           }
           let newRouting = Routing()
           _ = newRouting.route(routingEntry: routingEntry,
                                fromController: navController)
       }
    
    
    
    private func createGraph() {
      
        let headerview = self.chartView
        
        chartView.clipsToBounds = false
        let set = self.dayData!
        var entries : [ChartDataEntry] = []
        entries.append(.init(x: Double(set.newCasesText) ?? 0.0, y: Double(set.newDeathsText) ?? 0.0 ))

        let dataSet = LineChartDataSet(entries: entries, label: "Covid cases")
        // Chart colors template
        dataSet.colors = ChartColorTemplates.material()
        dataSet.mode = .cubicBezier
        dataSet.drawCirclesEnabled = false
        dataSet.lineWidth = 1.8
        dataSet.circleRadius = 4
        dataSet.setCircleColor(.white)
        dataSet.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        dataSet.fillColor = .white
        dataSet.fillAlpha = 1
        dataSet.drawHorizontalHighlightIndicatorEnabled = false
       
        let data: LineChartData = LineChartData(dataSet: dataSet)
        // Chart view with a frame
        
        let chart = LineChartView(frame: CGRect(x: 0, y: 0, width: contentView.frame.size.width/1.3, height: contentView.frame.size.width/2))
        
       
        chart.rightAxis.enabled = false
        
        let xAxis = chart.xAxis
        xAxis.labelPosition = .top
        xAxis.labelFont = .systemFont(ofSize: 6)
        xAxis.granularity = 1
        xAxis.labelCount = 7
        // Chart data
//        let l = chart.legend
//        l.horizontalAlignment = .left
//        l.verticalAlignment = .bottom
//        l.orientation = .horizontal
//        l.drawInside = false
//        l.form = .circle
//        l.formSize = 9
//        l.font = UIFont(name: "HelveticaNeue-Light", size: 10)!
        
//        l.xEntrySpace = 4
        chart.data = data
        // subviews
       
        headerview!.addSubview(chart)

       

    }
    

}
