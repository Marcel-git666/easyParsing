//
//  Model.swift
//  test_app
//
//  Created by Marcel Mravec on 02.05.2024.
//

import Foundation

struct Model: Identifiable {
    var id = UUID()
    
    let country: String
    let currencyName: String
    let amount: Int
    let code: String
    let exchangeRate: Double
    
    init(country: String, currencyName: String, amount: Int, code: String, exchangeRate: Double) {
        self.country = country
        self.currencyName = currencyName
        self.amount = amount
        self.code = code
        self.exchangeRate = exchangeRate
    }
}


struct Header {
    let countryRow: String
    let currencyNameRow: String
    let amountRow: String
    let codeRow: String
    let exchangeRateRow: String
    
    init(countryRow: String, currencyNameRow: String, amountRow: String, codeRow: String, exchangeRateRow: String) {
        self.countryRow = countryRow
        self.currencyNameRow = currencyNameRow
        self.amountRow = amountRow
        self.codeRow = codeRow
        self.exchangeRateRow = exchangeRateRow
    }
}

struct OtherValues {
    let dateOfExchangeRate: String
    let numberOfExchangeRate: Int
}
