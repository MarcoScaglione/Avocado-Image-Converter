//
//  ConversionView.swift
//  Image Converter
//
//  Created by Marco Scaglione on 15/12/21.
//

import SwiftUI


struct ConversionView: View {
    
    @State private var op1: Double = 0.0
    @State private var op2: Double = 0.0
    @State private var op3: Double = 0.0
    @State private var op4: Double = 0.0
    @State private var op5: Double = 0.0
    @State private var opt: Double = 0.0
    @State private var percentage = 0
    @State private var opp: Double = 1.0
    @Binding var isPresented : Bool
    


    
    var body: some View{
        
        ZStack{
            
           
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.red, .orange,.green]),startPoint: .top,endPoint: .bottom)
                )
                .ignoresSafeArea()
           
                
            Image("Avocado")
            
            Image("Cracks1")
                .opacity(op1)
                .animation(.linear(duration: 1.2),value: op1)

            Image("Cracks2")
                .opacity(op2)
                .animation(.linear(duration: 1.2),value: op2)

            Image("Cracks3")
                .opacity(op3)
                .animation(.linear(duration: 1.2),value: op3)

            Image("Cracks4")
                .opacity(op4)
                .animation(.linear(duration: 1.2),value: op4)

            Image("Cracks5")
                .opacity(op5)
                .animation(.linear(duration: 1.2),value: op5)
            
            Text("Completed!")
                .font(.largeTitle)
                .opacity(opt)

         
            Text("\(percentage)%")
                .font(.largeTitle)
                .opacity(opp)
            
            Circle()
                .stroke(.black,lineWidth: 2)
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(.black)
                
//            VStack{
//
//                Spacer(minLength: 40)
//
//            }
        }.navigationTitle("Converting")
            .onAppear{
                Timer.scheduledTimer(withTimeInterval: 0.66, repeats: true){
                    (_) in
                    if (percentage != 100) {
                        switch percentage {
                        case 0 : op1 = 1
                        case 20 : op2 = 1
                        case 40 : op3 = 1
                        case 60 : op4 = 1
                        case 80 : op5 = 1
                            opp = 0
                            opt = 1
                        default : print("error")
                        }
                        percentage = percentage+20
                    }
                    else{
                        percentage = 0
                        self.isPresented = false
                        
                    }
                }
            }
    }
}

//struct ConversionView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConversionView()
//    }
//}
//
