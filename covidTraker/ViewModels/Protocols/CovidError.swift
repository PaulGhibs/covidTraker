//
//  CovidError.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 19/11/2021.
//

import Foundation

enum CovidError: Error, Equatable {
    case  badURL
    case  noInfoFound
    case  wrongCollections
    
    func errorMessages() throws -> String {
        switch self {
        case .badURL:
            return NSLocalizedString("badurl", comment: "Oups ! je n'ai rien trouvé a cette adresse")
        case .noInfoFound:
            return NSLocalizedString("failTofecthinfos", comment: "Impossible de charger les infos!")
        case .wrongCollections:
            return NSLocalizedString("failTofetchCollection", comment: "Impossible de trouver le pays!")
    }
}
}




enum CountryFound {
    case countryFound
    case listCountry
    
    func successMessage() -> String {
        switch self {
        case .countryFound: return NSLocalizedString("CountryFound", comment: "succes")
        case .listCountry: return NSLocalizedString("here a list of country of found", comment: "error")
        }
    }
}
