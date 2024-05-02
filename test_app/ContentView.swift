//
//  ContentView.swift
//  test_app
//
//  Created by Marcel Mravec on 02.05.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm: ViewModel
    var body: some View {
        VStack {
            Text("Currency rates for \(vm.date?.dateOfExchangeRate ?? "unknown date") #\(vm.date?.numberOfExchangeRate ?? 0)")
                .font(.title)
            HStack {
                Text(vm.header?.countryRow ?? "")
                Text(vm.header?.currencyNameRow ?? "")
                Text(vm.header?.amountRow ?? "")
                Text(vm.header?.codeRow ?? "")
                Text(vm.header?.exchangeRateRow ?? "")
            }
            .font(.title3)
            VStack {
                ForEach(vm.models) { model in
                    HStack {
                        Text(model.country)
                        Text(model.currencyName)
                        Text("\(model.amount)")
                        Text(model.code)
                        Text("\(model.exchangeRate)")
                    }
                }
            }
            .font(.caption)
        }
        .padding()
        .onAppear() {
            vm.models = vm.parseValues(value: vm.values)
            vm.header = vm.parseHeader(value: vm.values)
            vm.date = vm.parseDateAndNumber(value: vm.values)
        }
    }
}

#Preview {
    ContentView(vm: ViewModel())
}
