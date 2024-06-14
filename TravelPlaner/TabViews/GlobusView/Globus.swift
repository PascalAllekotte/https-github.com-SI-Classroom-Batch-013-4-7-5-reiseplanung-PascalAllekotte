//
//  Globus.swift
//  TravelPlaner
//
//  Created by Pascal Allekotte on 14.06.24.
//

import SwiftUI

struct Globus: View {
    
    // MARK: - Functions

    @State private var showAddArea = false

    //--------------------
    
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Image("GlobusC")
                    .edgesIgnoringSafeArea(.all)
                    .shadow(radius: 1)
                
                VStack {
                    HStack {
                        Text("Globus!")
                            .font(.largeTitle)
                            .foregroundColor(.black.opacity(0.75))
                            .padding(.leading, 16)
                            .bold()
                        Spacer()
                    }
                    .padding(.top, -25)
                    
                    Spacer()
                    
                    NavigationLink(destination: Travel()) {
                        Text("Hello, World!")
                            .font(.largeTitle)
                            .foregroundColor(.black.opacity(0.75))
                            .padding()
                    }
                    .padding(.bottom, 40)
                }
            }
            .toolbar {
                Button(action: createArea) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.yellow.opacity(0.7))
                }
                .padding(.top, 35)
            }
            .sheet(isPresented: $showAddArea){
                GlobusDetail(isPresented: $showAddArea)
                    
            }
        }
    }
    
    private func createArea() {
        showAddArea.toggle()
    }
}




#Preview {
    Globus()
}
