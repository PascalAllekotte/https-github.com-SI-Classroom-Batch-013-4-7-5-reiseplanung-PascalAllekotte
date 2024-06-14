//
//  DestinationViewModel.swift
//  TravelPlaner
//
//  Created by Pascal Allekotte on 14.06.24.
//

import Foundation
import CoreData

class DestinationViewModel : ObservableObject {
    
    
    init(){
        fetchDestinations()
    }
    
    
    // MARK: - Variables
    
    @Published var destiantions: [Destination] = []
    
    let container = PersistentStore.shared
    
    
    //-------------------
    
    // MARK: - Functions
    
    // C - RUD
    func saveDestination(_ city: String, country: String, image: Data){ // Eventuell Data falsch
        let destination = Destination(context: container.context)
        destination.id = UUID()
        destination.city = city
        destination.country = country
        destination.image = image
        
        container.save()
        fetchDestinations()
    }
    
    // C -R- UD
    func fetchDestinations(){
        let request = Destination.fetchRequest()
        
        do {
            self.destiantions = try PersistentStore.shared.context.fetch(request)
        } catch let error {
            print("something went wrong while fetching destinations. \(error)")
        }
        
        
    }
    
    
    
    
    
    
}



