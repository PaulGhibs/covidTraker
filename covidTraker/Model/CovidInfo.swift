//
//  CovidInfo.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 17/11/2021.
//





import Foundation

// MARK: - CovidCollection
struct CovidCollection: Codable {
    let activeCasesText, countryText, lastUpdate, newCasesText: String
    let newDeathsText, totalCasesText, totalDeathsText, totalRecoveredText: String

    enum CodingKeys: String, CodingKey {
        case activeCasesText = "Active Cases_text"
        case countryText = "Country_text"
        case lastUpdate = "Last Update"
        case newCasesText = "New Cases_text"
        case newDeathsText = "New Deaths_text"
        case totalCasesText = "Total Cases_text"
        case totalDeathsText = "Total Deaths_text"
        case totalRecoveredText = "Total Recovered_text"
    }
}


struct DayData {
    let date : Date
    let count: Int
}




