//
//  The_GamesApp.swift
//  Shared
//
//  Created by William Santoso on 11/08/21.
//

import SwiftUI

@main
struct TheGamesApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
