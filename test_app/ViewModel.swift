//
//  ViewModel.swift
//  test_app
//
//  Created by Marcel Mravec on 02.05.2024.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var models: [Model] = []
    @Published var header: Header?
    @Published var date: OtherValues?
    
    let values = """
30.04.2024 #84
země|měna|množství|kód|kurz
Austrálie|dolar|1|AUD|15,312
Brazílie|real|1|BRL|4,581
Bulharsko|lev|1|BGN|12,857
Čína|žen-min-pi|1|CNY|3,239
Dánsko|koruna|1|DKK|3,371
EMU|euro|1|EUR|25,145
Filipíny|peso|100|PHP|40,655
Hongkong|dolar|1|HKD|2,999
Indie|rupie|100|INR|28,113
Indonesie|rupie|1000|IDR|1,442
Island|koruna|100|ISK|16,730
Izrael|nový šekel|1|ILS|6,257
Japonsko|jen|100|JPY|14,941
Jižní Afrika|rand|1|ZAR|1,253
Kanada|dolar|1|CAD|17,138
Korejská republika|won|100|KRW|1,699
Maďarsko|forint|100|HUF|6,438
Malajsie|ringgit|1|MYR|4,914
Mexiko|peso|1|MXN|1,382
MMF|ZPČ|1|XDR|30,911
Norsko|koruna|1|NOK|2,129
Nový Zéland|dolar|1|NZD|13,946
Polsko|zlotý|1|PLN|5,821
Rumunsko|leu|1|RON|5,053
Singapur|dolar|1|SGD|17,229
Švédsko|koruna|1|SEK|2,140
Švýcarsko|frank|1|CHF|25,692
Thajsko|baht|100|THB|63,290
Turecko|lira|100|TRY|72,429
USA|dolar|1|USD|23,453
Velká Británie|libra|1|GBP|29,417
"""
   
    func parseValues(value: String) -> [Model] {
        let lines = value.split(separator: "\n").dropFirst(2)
        let models = lines.map { line -> Model in
            let components = line.split(separator: "|").map { String($0) }
            return Model(country: components[0],
                         currencyName: components[1],
                         amount: Int(components[2]) ?? 0,
                         code: components[3],
                         exchangeRate: Double(components[4].replacingOccurrences(of: ",", with: ".")) ?? 0)
        }
        return models
    }
    
    func parseHeader(value: String) -> Header {
        let line = value.split(separator: "\n").dropFirst().first
        let header = line?.split(separator: "|").map { String($0) }
        print("Header is \(header)")
        guard let header else { return Header(countryRow: "", currencyNameRow: "", amountRow: "", codeRow: "", exchangeRateRow: "")}
        return Header(countryRow: header[0], currencyNameRow: header[1], amountRow: header[2], codeRow: header[3], exchangeRateRow: header[4])
    }
    
    func parseDateAndNumber(value: String) -> OtherValues {
        let line = value.split(separator: "\n").first
        let dateValues = line?.split(separator: "#").map { String($0) }
        print("Date values are \(dateValues)")
        guard let dateValues else { return OtherValues(dateOfExchangeRate: "", numberOfExchangeRate: 0) }
        return OtherValues(dateOfExchangeRate: dateValues[0], numberOfExchangeRate: Int(dateValues[1]) ?? 0)
    }
    
}
