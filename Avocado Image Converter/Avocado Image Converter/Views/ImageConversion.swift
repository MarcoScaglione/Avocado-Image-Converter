//
//  File.swift
//  Image Converter
//
//  Created by Marco Scaglione on 13/12/21.
//

import SwiftUI
import UIKit

struct ImageConversion: View {
    var formats = [".JPG",".PNG",".GIF",".JPEG"]
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var presentImporter = false
    @State private var showingImagePicker = false
    @State private var selectedImage: UIImage?
    @State var method = 1
    @State private var formatType = 0
    @State private var presentConversion = false
    
    
    
    
    
    
    var body: some View{
        
        
        if(method == 1){
            
            
            ZStack{
                
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.red, .orange,.green]),startPoint: .top,endPoint: .bottom)
                    )
                    .ignoresSafeArea()
                
                
                VStack{
                    Spacer(minLength: 50)
                    Form{
                        
                        Section{
                            Button{
                                showingImagePicker.toggle()
                                
                            }
                        label: {
                            if(selectedImage == nil) {
                                HStack{
                                    
                                    Text("Select the image")
                                        .font(.title3)
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: 75, height: 75)
                                        .padding(.trailing)
                                        .foregroundColor(Color(UIColor.systemFill))
                                }
                            }
                            else{
                                HStack{
                                    
                                    
                                    Text("Change image")
                                        .font(.title3)
                                    Spacer()
                                    
                                    Image(uiImage: selectedImage!)
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                        .padding(.trailing)
                                        .clipShape(Rectangle())
                                }
                            }
                        }
                        }
                        
                        
                        Section{
                            Picker(selection: $formatType, label: Text("Destination format").foregroundColor(Color("Tint"))){
                                ForEach(0 ..< formats.count){
                                    Text(self.formats[$0])
                                }
                                
                            }
                            
                        }
                    }
                    Form{
                        
                        Button{
                            if( selectedImage != nil){
                                
                                presentConversion.toggle()
                                
                            }
                        }label: {
                            
                            HStack{
                                
                                Label("",systemImage: "arrow.triangle.2.circlepath.circle")
                                    .font(.title3)
                                
                                Text("Convert File")
                                    .font(.title3)
                            }.frame(width: 200, height: 60)
                        }
                    }
                    
                } .sheet(isPresented: self.$showingImagePicker) {
                    PhotoPickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                    
                    
                }
                .sheet(isPresented: self.$presentConversion){
                    ConversionView(isPresented: $presentConversion)
                }
            }.navigationTitle("Image Conversion")
            
            
        }
        else{
            ZStack{
                
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.red, .orange,.green]),startPoint: .top,endPoint: .bottom)
                    )
                    .ignoresSafeArea()
                
                
                VStack{
                    Spacer(minLength: 50)
                    Form{
                        
                        Section{
                            Button{
                                if (presentImporter ==  true){
                                    presentImporter.toggle()
                                }
                                else {
                                    presentImporter = true
                                }
                            }
                        label: {
                            if(selectedImage == nil) {
                                HStack{
                                    
                                    Text("Select the image")
                                        .font(.title3)
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: 75, height: 75)
                                        .padding(.trailing)
                                        .foregroundColor(Color(UIColor.systemFill))
                                }
                            }
                            else{
                                HStack{
                                    
                                    Text("Change image")
                                        .font(.title3)
                                    
                                    Spacer()
                                    
                                    Image(uiImage: selectedImage!)
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                        .padding(.trailing)
                                        .clipShape(Rectangle())
                                }
                            }
                        }
                        }
                        
                        
                        Section{
                            
                            Picker(selection: $formatType, label: Text("Destination format").foregroundColor(Color("Tint"))){
                                ForEach(0 ..< formats.count){
                                    Text(self.formats[$0])
                                    
                                }
                                
                            }
                            
                        }
                    }
                    Form{
                        
                        Button{
                            presentConversion.toggle()
                        }label: {
                            
                            HStack{
                                
                                Label("",systemImage: "arrow.triangle.2.circlepath.circle")
                                    .font(.title3)
                                
                                Text("Convert File")
                                    .font(.title3)
                            }.frame(width: 200, height: 60)
                        }
                    }
                    
                    
                    
                    
                }.fileImporter(isPresented: $presentImporter, allowedContentTypes: [.jpeg,.gif,.png]) { result in
                    switch result {
                    case .success(let url):
                        print(url)
                        url.startAccessingSecurityScopedResource()
                        if let imageData = try? Data(contentsOf: url),
                                               let image = UIImage(data: imageData) {
                                self.selectedImage = image
                            }
                            url.stopAccessingSecurityScopedResource()
                            
                    case .failure(let error):
                        print(error)
                    }
                }.sheet(isPresented: self.$presentConversion){
                    ConversionView(isPresented: $presentConversion)
                }
            }.navigationTitle("Image Conversion")
        }
    }
    
}


struct ImageConversion_Previews: PreviewProvider {
    static var previews: some View {
        ImageConversion()
    }
}
