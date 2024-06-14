//
//  GlobusDetail.swift
//  TravelPlaner
//
//  Created by Pascal Allekotte on 14.06.24.
//

import SwiftUI

struct GlobusDetail: View {
    
    // MARK: - Variables
    
    @Binding var isPresented: Bool
    
    //-------------------
    var body: some View {
        VStack{
            Text("Hallo")
            
        }
    }
}

#Preview {
    GlobusDetail(isPresented: .constant(false))
}
