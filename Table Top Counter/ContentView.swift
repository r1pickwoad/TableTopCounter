 //
 //  ContentView.swift
 //  Table Top Counter
 //
 //  Created by Wolvie on 4/19/20.
 //  Copyright © 2020 Wolvie. All rights reserved.
 //
 
 import SwiftUI
 
 struct ContentView: View {
    @State private var count: Int = 0
    @State private var pmChange: Int = 0
    private var incDecAmount = [1, 5, 10, 15, 20, 25]
    
    private var stringFormatter: NumberFormatter = {
        let counter = NumberFormatter()
        counter.numberStyle = .none
        
        return counter
    }()
    
    var body: some View {
        
        ZStack{
            //Background
            Rectangle()
                .foregroundColor(Color.black)
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            //Main View
            VStack{
                
                //Name of App
                Text("TableTop Counter")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
                
                HStack() {
                    
                    Spacer()
                    
                    //Button to Increment
                    Button(action: {
                        self.count += Int(self.incDecAmount[self.pmChange])
                    })
                    {
                        Image(systemName: "arrowtriangle.up.fill")
                            .foregroundColor(.white)
                    }.scaleEffect(2)
                    
                    Spacer()
                    
                    //Label and User Input
                    HStack() {
                        Text("Total:")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        TextField("", value: $count, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    .frame(width: 200.0)
                    
                    Spacer()
                    
                    //Button to Decrement
                    Button(action: {
                        //Allow values to decrement if current value greater than 0
                        if self.count > 0 {
                            self.count -= Int(self.incDecAmount[self.pmChange])
                            //Set Counter Value to 0 if value would be less than 0
                            if self.count < 0 {
                                self.count = 0
                            }
                        }
                    })
                    {
                        Image(systemName:"arrowtriangle.down.fill")
                            .foregroundColor(.white)
                    }.scaleEffect(2)
                    
                    Spacer()
                }
                
                //Explanatory Text for Selection
                Text("+/- Amount")
                    .font(.headline)
                    .foregroundColor(.white)
                
                //Selection of +/- Amount
                Picker("+/- Amount", selection: $pmChange) {
                    ForEach(0 ..< incDecAmount.count){
                        Text(String(self.incDecAmount[$0]))
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.bottom, 100)
                
                Spacer()
            }
        }
    }
 }
 
 struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
 }
