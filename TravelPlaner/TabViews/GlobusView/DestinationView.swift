//
//  Area.swift
//  TravelPlaner
//
//  Created by Pascal Allekotte on 14.06.24.
//

import SwiftUI

struct Area: View {
    
    // MARK: - Variables
    
    @ObservedObject var destination: Destination
    
    
    //-------------------
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                VStack{
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
                Button(action: delete){
                    Image(systemName: "trash")
                        .scaledToFill()
                        .frame(width: 14, height: 4)
                        .foregroundColor(.yellow.opacity(0.75))
                        .padding()
                        .background(Circle().fill(Color.white))
                    
                    
                }
                
            }
            .padding(5)
            
            
            
        }
        .frame(maxHeight: 150)
        .padding(.horizontal, 10)
        .background(
            Image(uiImage: destinationImage())
                .resizable()
                .aspectRatio(contentMode: .fill))
            
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
    
    


// MARK: - Functions

func delete(){
    // Hier muss noch später das ViewModel implementiert werden
}

// Funktion zum Laden des Bildes
func destinationImage() -> UIImage {
    if let imageData = destination.image, let uiImage = UIImage(data: imageData) {
        return uiImage
    } else {
        return UIImage(named: "Mülheim") ?? UIImage()
    }
}
}

//-------------------



#Preview {
    Area(destination: .init(context: PersistentStore.shared.context))
}
