//
//  ContentView.swift
//  Image Converter
//
//  Created by Marco Scaglione on 06/12/21.
//

import SwiftUI

struct ImageSelection: View {
    init(){
        Theme.navigationBarColors(background : .clear, titleColor: .white, tintColor: UIColor(Color("Tint")))
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().tintColor = UIColor(Color("Tint"))
        UIPickerView.appearance().tintColor = UIColor(Color("Tint"))
        
    }

    @State private var presentInfo = false
   
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.red, .orange,.green]),startPoint: .top,endPoint: .bottom)
                    )
                    .ignoresSafeArea()
                VStack{
                    
                    VStack(spacing: 6){
                        
                        
                        Text("Image Selection")
                            .foregroundColor(SwiftUI.Color.white)
                            .fontWeight(.bold)
                            .font(.largeTitle)
                        
                        
                        Text("Select the image location")
                            .foregroundColor(SwiftUI.Color.white)
                            .fontWeight(.bold)
                            .font(.subheadline)
                        
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 15){
                        
                        NavigationLink(destination: ImageConversion(method: 1)){
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 264, height: 125)
                                    .border(.black)
                                    .foregroundColor(Color.yellow)
                                
                                HStack(spacing: 40){
                                    
                                    VStack(spacing:5){
                                        Text("Photos")
                                        
                                            .foregroundColor(.black)
                                            .font(.largeTitle)
                                            .fontWeight(.semibold)
                                        Text("Media Library")
                                            .foregroundColor(.black)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                    }
                                    VStack(spacing:5){
                                        Label("", systemImage: "photo")
                                            .foregroundColor(.black)
                                            .font(.largeTitle)
                                        Text("")
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                        
                                    }
                                }
                            }
                        }
                        NavigationLink(destination: ImageConversion(method: 2)){
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 264, height: 125)
                                    .border(.black)
                                    .foregroundColor(Color.orange)
                                
                                HStack(spacing: 75){
                                    
                                    VStack(spacing:5){
                                        Text("Files")
                                            .foregroundColor(.black)
                                            .font(.largeTitle)
                                            .fontWeight(.semibold)
                                        Text("Files App")
                                            .foregroundColor(.black)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                    }
                                    VStack(spacing:5){
                                        Label("", systemImage: "folder")
                                            .foregroundColor(.black)
                                            .font(.largeTitle)
                                        Text("")
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                        
                                    }
                                }
                            }
                            

                            
                        }
                    }
                    Spacer()
                }.background(Avocado())
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            
                            Button(action: {
                                presentInfo.toggle()
                            })
                            {
                                Label("", systemImage: "info.circle")
                                    .foregroundColor((Color("Tint")))
                                    .font(.title3)
                                
                                
                            }
                        }
                    }
            }
        }
        .sheet(isPresented: self.$presentInfo) {
            InfoView()
        }
        
    }
    
}

struct ImageSelection_Previews: PreviewProvider {
    static var previews: some View {
        ImageSelection()
    }
}
