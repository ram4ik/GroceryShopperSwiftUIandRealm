//
//  GroceryShopperSwiftUIandRealmApp.swift
//  GroceryShopperSwiftUIandRealm
//
//  Created by ramil on 16.12.2020.
//

import SwiftUI

@main
struct GroceryShopperSwiftUIandRealmApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ShoppingStore(realm: RealmPersistence.initializer()))
        }
    }
}
