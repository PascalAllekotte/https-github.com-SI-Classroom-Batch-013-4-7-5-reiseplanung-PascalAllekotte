//
//  Area.swift
//  TravelPlaner
//
//  Created by Pascal Allekotte on 14.06.24.
//

import SwiftUI

struct Area: View {
    @State private var cityName = ""
    @State private var countryName = ""

    var body: some View {
        VStack{
            Text("Test")
        }
        
        .frame(minWidth: 350, maxHeight: 70)
        .padding(.horizontal, -50)
        .background(Color.gray.opacity(0.2))
    }
}

#Preview {
    Area()
}
