//
//  ContentView.swift
//  ConvertorMultiple
//
//  Created by Kiril Pranys on 24.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 0
    @State var fromConversionIndexKm = 0
    @State var toConversionIndexKm = 0
    @State var fromConversionIndexT = 1
    @State var toConversionIndexT = 2
    @State var fromConversionIndexTime = 2
    @State var toConversionIndexTime = 1
    @State var inputAmount = ""
    @State var valueConvertion = ["Length", "Temprature", "Time", "Volume"]
    
    let unitsKm: [(unitNameKm: String, conversionRateKm: Double)] = [("mm", 0.001), ("m", 1.0), ("km", 1000), ("inch", 0.0254), ("foot", 0.3048), ("yard", 0.9144), ("mile", 1_609.344)]
    
    let unitsT: [(unitNameT: String, conversionRateT: Double)] = [("Fahrenheit", 33.8), ("Celsius", 1), ("Kelvin", 274.15)]
    
    let unitsTime : [(unitNameTime: String, conversionRateTime: Double)] = [("Seconds", 0.016667), ("Minutes", 1), ("Hours", 60)]
    
    var inputValue: Double {
        return Double(inputAmount) ?? 0
    }
    
    var unitAmountKm: Double {
        let unit = unitsKm[fromConversionIndexKm]
        return inputValue * unit.conversionRateKm
    }
    
    var convertedAmountKm: Double{
        let unit = unitsKm[toConversionIndexKm]
        return unitAmountKm / unit.conversionRateKm
    }
    
    var unitAmountT: Double{
        let unit = unitsT[fromConversionIndexT]
        return inputValue * unit.conversionRateT
    }
    
    
    var convertedAmountT: Double {
        let unit = unitsT[toConversionIndexT]
        return unitAmountT / unit.conversionRateT
    }
    
    var unitAmountTime: Double{
        let unit = unitsTime[fromConversionIndexTime]
        return inputValue * unit.conversionRateTime
    }
    
    
    var convertedAmountTime: Double {
        let unit = unitsTime[toConversionIndexTime]
        return unitAmountTime / unit.conversionRateTime
    }

    
    var body: some View {
        TabView(selection: $selection){
            Form{
                Section(header: Text("Convert \(valueConvertion[0])")){
                    TextField("Amount to convert", text: $inputAmount)
                        .keyboardType(.decimalPad)
                    Picker("from unit", selection: $fromConversionIndexKm){
                        ForEach(0 ..< unitsKm.count){
                            Text("\(self.unitsKm[$0].unitNameKm)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("To")){
                    Picker("To unit", selection: $toConversionIndexKm){
                        ForEach(0..<unitsKm.count){
                            Text("\(self.unitsKm[$0].unitNameKm)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("End value")){
                    Text("\(inputValue == 0 ? "Input value to convert" : String(convertedAmountKm))")
                }
            }
            .tabItem {
                Image(systemName: "ruler")
                Text(valueConvertion[0])
            }
            .tag(0)
            Form{
                Section(header: Text("Convert \(valueConvertion[1])")){
                    TextField("Amount to convert", text: $inputAmount)
                        .keyboardType(.decimalPad)
                    Picker("from unit", selection: $fromConversionIndexT){
                        ForEach(0..<unitsT.count){
                            Text("\(self.unitsT[$0].unitNameT)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("To")){
                    Picker("To unit", selection: $toConversionIndexT){
                        ForEach(0..<unitsT.count){
                            Text("\(self.unitsT[$0].unitNameT)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("End Value")){
                    Text(String(convertedAmountT))
                }
            }
            .tabItem{
                Image(systemName: "thermometer")
                Text(valueConvertion[1])
            }
            .tag(1)
            Form{
                Section(header: Text("Convert \(valueConvertion[2])")){
                    TextField("Amount to convert", text: $inputAmount)
                        .keyboardType(.decimalPad)
                    Picker("from unit", selection: $fromConversionIndexTime){
                        ForEach(0..<unitsTime.count){
                            Text("\(self.unitsTime[$0].unitNameTime)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("To")){
                    Picker("To unit", selection: $toConversionIndexTime){
                        ForEach(0..<unitsTime.count){
                            Text("\(self.unitsTime[$0].unitNameTime)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("End Value")){
                    Text("\(inputValue == 0 ? "Input value to converte" : String(convertedAmountTime))")
                }
            }
                .tabItem{
                    Image(systemName: "clock.arrow.2.circlepath")
                    Text(valueConvertion[2])
                }
                .tag(2)
            Form{
                Section(header: Text("Convert \(valueConvertion[3])")){
                    TextField("Amount to convert", text: $inputAmount)
                        .keyboardType(.decimalPad)
                }
            }
                .tabItem{
                    Image(systemName: "speaker.wave.3")
                    Text(valueConvertion[3])
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
