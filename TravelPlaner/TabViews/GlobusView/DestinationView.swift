//
//  Area.swift
//  TravelPlaner
//
//  Created by Pascal Allekotte on 14.06.24.
//

import SwiftUI

struct DestinationItem: View {
    
    // MARK: - Variables
    @ObservedObject var destination: Destination
    @ObservedObject var viewModel: DestinationViewModel
    
    //-------------------
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack {
                    Text(destination.city ?? "Mülheim")
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text(destination.country ?? "Germany")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                }
                .padding(3)
                .background(.gray.opacity(0.7))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
                Button(action: delete) {
                    Image(systemName: "trash")
                        .scaledToFill()
                        .frame(width: 14, height: 14)
                        .foregroundColor(.yellow.opacity(0.75))
                        .padding()
                        .background(Circle().fill(Color.white))
                }
            }
            .padding(5)
        }
        .frame(height: 150)
        .padding(.horizontal, 10)
        .background(
            Group {
                if let imageData = destination.image, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        )
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(radius: 10)
    }
    
    // MARK: - Functions
    func delete() {
        viewModel.deleteDestinations(destination)
    }
}


    //--------------------

#Preview {
    DestinationItem(destination: .init(context: PersistentStore.shared.context), viewModel: DestinationViewModel())
}
