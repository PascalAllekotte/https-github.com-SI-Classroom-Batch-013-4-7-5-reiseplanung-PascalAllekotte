//
//  Globus.swift
//  TravelPlaner
//
//  Created by Pascal Allekotte on 14.06.24.
//

import SwiftUI

struct Globus: View {
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .top) {
                Image("GlobeB")
                    .edgesIgnoringSafeArea(.all)
                
                HStack {
                    Text("Globus!")
                        .font(.largeTitle)
                        .foregroundColor(.white.opacity(0.95))
                        .padding(.leading, -170)
                        .padding()
                        .bold()
                }
                
                VStack {
                    Spacer()
                    NavigationLink(destination: Travel()) {
                        Text("Hello, World!")
                            .font(.largeTitle)
                            .foregroundColor(.black.opacity(0.75))
                            .padding()
                    }
                }
            }
        }
    }
}





#Preview {
    Globus()
}
