//
//  ContentView.swift
//  Unit_Conversion
//
//  Created by Iven Prillwitz on 12.10.19.
//  Copyright © 2019 Iven Prillwitz. All rights reserved.
//

import SwiftUI

enum UnitType : Int {
    case temperature = 0
    case length = 1
    case time = 2
    case volume = 3
}

struct Unit : Identifiable {
    var id: Int
    var name : String
    var type : UnitType
}

struct ContentView: View {
    @State var units = ["temp", "length", "time", "volumes"]
    @State var unitvalues = [Unit(id: 1,name: "celsius", type: .temperature),
                        Unit(id: 2,name: "fahrenheit", type: .temperature),
                        Unit(id: 3,name: "kelvin", type: .temperature),
                        Unit(id: 4,name: "meters", type: .length),
                        Unit(id: 5,name: "kilometers", type: .length),
                        Unit(id: 6,name: "feet", type: .length),
                        Unit(id: 7,name: "yards", type: .length),
                        Unit(id: 8,name: "miles", type: .length),
                        Unit(id: 9,name: "seconds", type: .time),
                        Unit(id: 10,name: "minutes", type: .time),
                        Unit(id: 11,name: "hours", type: .time),
                        Unit(id: 12,name: "days", type: .time),
                        Unit(id: 13,name: "milliliters", type: .volume),
                        Unit(id: 14,name: "liters", type: .volume),
                        Unit(id: 15,name: "cups", type: .volume),
                        Unit(id: 16,name: "pints", type: .volume),
                        Unit(id: 17,name: "gallons", type: .volume)]
    
    @State var selectedUnit = 0
    @State var selectedInputUnit = 0
    @State var selectedOutputUnit = 0
    @State var userValue = 0
    @State var outputValue = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("unit", selection: $selectedUnit) {
                        ForEach(0 ..< units.count){
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Picker("unit", selection: $selectedInputUnit) {
                        ForEach(0 ..< unitvalues.filter({$0.type.rawValue == self.selectedUnit}).count){ unit in
                            Text("\(self.unitvalues.filter({$0.type.rawValue == self.selectedUnit})[unit].name)")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitle(Text("Conversion"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
