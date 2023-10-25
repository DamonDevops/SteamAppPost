//
//  CoreDataModel.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import Foundation
import Combine
import CoreData

class CoreDataModel :NSObject, ObservableObject{
    private let viewContext: NSManagedObjectContext
    
    @Published var favGames = [FavGame]()

    private var controller: NSFetchedResultsController<FavGame>
    private var cancellable: AnyCancellable?

    init(viewContext: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.viewContext = viewContext

        let request = FavGame.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \FavGame.timestamp, ascending: true)]
        controller = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil)

        super.init()
        
        controller.delegate = self
        try? controller.performFetch()
        favGames = controller.fetchedObjects ?? []
    }

    func stopObservation() {
        cancellable?.cancel()
    }

    func addItem(game :GameModel) {
        let newItem = FavGame(context: viewContext)
        newItem.gameId = Int32(game.id)
        newItem.timestamp = Date()
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    func deleteItem(game :GameModel) {
        
        if let removedItem = favGames.filter({ $0.gameId == game.id }).first {
            viewContext.delete(removedItem)
        }

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func dateFormatter(date :Date) -> String{
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MMM dd,yyyy"
        
        return dateFormat.string(from: date)
    }
}


extension CoreDataModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        favGames = controller.fetchedObjects as? [FavGame] ?? []
    }
}
