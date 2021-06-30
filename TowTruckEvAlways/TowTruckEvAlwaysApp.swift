//
//  TowTruckEvAlwaysApp.swift
//  TowTruckEvAlways
//
//  Created by Дмитрий Крюков on 09.06.2021.
//

import SwiftUI
import Firebase

@main
struct TowTruckEvAlwaysApp: App {
    let persistenceController = PersistenceController.shared
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
