//
//  ContentView.swift
//  TwoWayBindings
//
//  Created by Lori Rothermel on 8/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var pressCount = 0
    @State private var toggleIsOn = true
    @State private var name = ""
    @State private var selectedColor: Color = .red
    @State private var selectedDate = Date()
    @State private var stepperValue = 1
    
    
    var body: some View {
        VStack {
            Group {
                Spacer()
                
                Text("Press Count: \(pressCount)")
                
                Button("Press Me") {
                    pressCount += 1
                }  // Button
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                TextField("Enter a name", text: $name)
                    .textFieldStyle(.roundedBorder)
                Text("Name entered: \(name)")
                
            }  // Group
                
            Spacer()
            
            Rectangle()
                .fill(selectedColor)
                .frame(width: 100, height: 100)
            
            ColorPicker(selection: $selectedColor, label: {
                Text("Pick a rectangle color: ")
            })
            
            Spacer()
            
            Toggle("Toggle is: \(toggleIsOn ? "On" : "Off")", isOn: $toggleIsOn)
                .padding()
            
            Spacer()
            
            DatePicker("Date: ", selection: $selectedDate)
            Text("Selected Date is: \(selectedDate.formatted(date: .abbreviated, time: .shortened))")
            
            Spacer()
            
            Stepper("Stepper Value: \(stepperValue)", value: $stepperValue, in: 1...10)
            
            Spacer()
            
        }  // VStack
        .font(.title2)
        .padding()
        
        
    } // some View
}  // ContentView

#Preview {
    ContentView()
}

