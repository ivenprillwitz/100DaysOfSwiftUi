//
//  ContentView.swift
//  WeSplit
//
//  Created by Iven Prillwitz on 08.10.19.
//  Copyright © 2019 Iven Prillwitz. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    var totalPerPerson: Double {

        let nop = Double(numberOfPeople) ?? 0
        let peopleCount = Double(nop + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var totalCheckAmountPlusTip : Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        
        return orderAmount + tipValue
    }
    
    var checkAmountValue: Double {
        let value = Double(checkAmount) ?? 0
        return value
    }
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number Of People", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                }
                Section(header:Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total amount")) {
                    Text("$\(checkAmountValue, specifier: "%.2f")")
                    Text("$\(totalCheckAmountPlusTip, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle(Text("WeSplit"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
