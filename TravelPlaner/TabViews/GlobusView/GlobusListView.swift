//
//  Globus.swift
//  TravelPlaner
//
//  Created by Pascal Allekotte on 14.06.24.
//

import SwiftUI

struct Globus: View {
    
    // MARK: - Variables
    
    @State private var showAddArea = false
    
    @StateObject private var viewModel = DestinationViewModel()
    
    //--------------------
    
    
    var body: some View {
        
        NavigationStack {
            ScrollView{
                VStack {
                    
                    
                    Spacer()
                    
                    ForEach(viewModel.destinations.reversed()){ destination in
                        DestinationItem(destination: destination, viewModel: viewModel)
                    }
                    
                    
                    .padding()
                }
            }
            .navigationTitle("Globus")
            .toolbar {
                Button(action: createArea) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.yellow.opacity(0.7))
                }
            }
        }
        
        .sheet(isPresented: $showAddArea){
            DestinationDetail(isPresented: $showAddArea)
                .onDisappear {
                                    viewModel.fetchDestinations()
                                }
            
        }
    
        
        .onAppear{
            viewModel.fetchDestinations()
        }
        
    }
    
    private func createArea() {
        showAddArea.toggle()
    }
}




#Preview {
    Globus()
}
