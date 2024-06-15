//
//  DestinationViewModel.swift
//  TravelPlaner
//
//  Created by Pascal Allekotte on 14.06.24.
//

import Foundation
import CoreData
import PhotosUI
import SwiftUI

class DestinationViewModel: ObservableObject {

    init() {
        fetchDestinations()
    }

    // MARK: - Variables
    @Published var destinations: [Destination] = []

    let container = PersistentStore.shared

    //-------------------

    // MARK: - Functions

    // C - RUD
    func saveDestination(_ city: String, country: String, photoPickerItem: PhotosPickerItem?) {
        let destination = Destination(context: self.container.context)
        destination.id = UUID()
        destination.city = city
        destination.country = country
        photoPickerItem?.loadTransferable(type: Data.self) { result in
            if let data = try? result.get() {
                destination.image = data
            }
            self.container.save()
            self.fetchDestinations()
        }
    }

    // C -R- UD
    func fetchDestinations() {
        let request = Destination.fetchRequest()

        do {
            self.destinations = try PersistentStore.shared.context.fetch(request)
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        } catch let error {
            print("something went wrong while fetching destinations. \(error)")
        }
    }

    // CR -U- D
    func updateDestinations(_ destination: Destination, city: String) {
        destination.city = city
        container.save()
        fetchDestinations()
    }

    // CRU -D-
    func deleteDestinations(_ destination: Destination) {
        container.context.delete(destination)
        container.save()
        fetchDestinations()
    }
}




