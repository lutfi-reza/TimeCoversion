//
//  ContentView.swift
//  TimeCoversion
//
//  Created by Lutfi Syahreza Lubis on 16/05/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputTime = 0.0
    
    enum TimeUnits: CaseIterable {
        case seconds, minutes, hours, days
        
        var title: String {
                switch self {
                case .seconds:
                    return "Seconds"
                case .minutes:
                    return "Minutes"
                case .hours:
                    return "Hours"
                case .days:
                    return "Days"
                }
            }
    }
    @State private var inputUnit = TimeUnits.seconds
    
//    enum OutputUnits: CaseIterable {
//        case seconds, minutes, hours, days
//        
//        var title: String {
//                switch self {
//                case .seconds:
//                    return "Seconds"
//                case .minutes:
//                    return "Minutes"
//                case .hours:
//                    return "Hours"
//                case .days:
//                    return "Days"
//                }
//            }
//    }
    @State private var outputUnit = TimeUnits.seconds

//  computed properties
    var convertToSeconds: Double {
        switch inputUnit {
        case.seconds:
            return inputTime
        case.minutes:
            return inputTime * 60
        case.hours:
            return inputTime * 3_600
        case.days:
            return inputTime * 86_400
        }
    }
    
    var outputTime: Double {
        switch outputUnit {
        case.seconds:
            return convertToSeconds
        case.minutes:
            return convertToSeconds / 60
        case.hours:
            return convertToSeconds / 3_600
        case.days:
            return convertToSeconds / 86_400
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Insert Time") {
                    TextField("Insert Time", value: $inputTime, format: .number)
                }
                
                Section ("Select Time Unit") {
                    Picker("Select Time Unit", selection: $inputUnit) {
                        ForEach(TimeUnits.allCases, id: \.self) {
                            Text($0.title)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section ("Select \"Unit\" to Convert to") {
                    Picker("Select Time Unit", selection: $outputUnit) {
                        ForEach(TimeUnits.allCases, id: \.self) {
                            Text($0.title)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Converted Time") {
                    Text(outputTime, format: .number)
                }
    
            }
            .navigationTitle("Time Conversion")
        }
    }
}

#Preview {
    ContentView()
}
