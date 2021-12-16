//
//  Avocado.swift
//  Image Converter
//
//  Created by Marco Scaglione on 12/12/21.
//

import SwiftUI

struct Avocado: View {
    
    @State private var presentImporter = false
    
    var body: some View {
        
        
        
        Image("Avocado")
            .frame(width: 100, height: 100, alignment: .center)
        
        
    }
    
}

struct Avocado_Previews: PreviewProvider {
    static var previews: some View {
        Avocado()
    }
}
