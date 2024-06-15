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
    @State private var image: UIImage? = nil
    @State private var photosPickerItem: PhotosPickerItem? = nil
    
    @ObservedObject var viewModel = DestinationViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Image")){
                        PhotosPicker("Choose Image", selection: $photosPickerItem)
                            .onChange(of: photosPickerItem) { newItem in
                                if let newItem = newItem {
                                    newItem.loadTransferable(type: Data.self) { result in
                                        switch result {
                                        case .success(let data):
                                            if let data = data, let uiImage = UIImage(data: data) {
                                                self.image = uiImage
                                            }
                                        case .failure(let error):
                                            print("error loading the picture: \(error.localizedDescription)")
                                        }
                                    }
                                }
                            }
                        if let image = image {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 300, height: 150)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .aspectRatio(contentMode: .fit)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                    
                    
                    Section(header: Text("Ort")) {
                        TextField("City", text: $city)
                        TextField("Country", text: $country)
                    }
                    
                    
                    Button("Save") {
                        viewModel.saveDestination(city, country: country, photoPickerItem: photosPickerItem)
                        isPresented = false
                    }
                }
            }
        }
        .navigationTitle("Add Destination")
        
    }
    
}






#Preview {
    DestinationDetail(isPresented: .constant(false))
}
