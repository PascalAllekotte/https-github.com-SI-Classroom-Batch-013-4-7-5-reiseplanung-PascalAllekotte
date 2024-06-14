//
//  GlobusDetail.swift
//  TravelPlaner
//
//  Created by Pascal Allekotte on 14.06.24.
//

import SwiftUI
import PhotosUI

struct DestinationDetail: View {
    
    // MARK: - Variables
    
    @Binding var isPresented: Bool
    
    @State private var city = ""
    @State private var country = ""
    @State private var imageItem: PhotosPickerItem?
    @State private var avatarImage: Image?

    //-------------------
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    
                    PhotosPicker("Choose Image", selection: $imageItem, matching: .images)
                                          .onChange(of: imageItem) { newValue in
                                              Task {
                                                  if let loaded = try? await newValue?.loadTransferable(type: Image.self) {
                                                      avatarImage = loaded
                                                  } else {
                                                      print("Failed")
                                                  }
                                              }
                                          }
                    
                    avatarImage?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                    Section(header: Text("Ort")) {
                        TextField("City", text: $city)
                        TextField("Country", text: $country)
                        
                        
                    }
                    Button("Safe"){
                        
                        isPresented = false
                    }
                }
             
             
                
                
                
            }
            
            .navigationTitle("Add Destination")
            

        }
    }
    
}

#Preview {
    DestinationDetail(isPresented: .constant(false))
}
