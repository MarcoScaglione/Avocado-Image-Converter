//
//  InfoView.swift
//  Image Converter
//
//  Created by Marco Scaglione on 15/12/21.
//

import SwiftUI


struct InfoView: View {
    
    var body: some View{
        NavigationView{
        ZStack{
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.red, .orange,.green]),startPoint: .top,endPoint: .bottom)
                )
                .ignoresSafeArea()

            VStack{
                Form{
                    Section{
                        
                    
                    Text("While in a different app, tap on the share button to add the desired image to your files; After that you will be able to select it through the file button.")
                   
                    }
                    Section("Made by"){
                        Text("Marco Scaglione")
                    }
                }
                Spacer(minLength: 40)

            }
        }.navigationTitle("Adding to File app?")
    }
    }
}
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

