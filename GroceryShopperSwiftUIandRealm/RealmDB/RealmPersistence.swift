//
//  RealmPersistence.swift
//  GroceryShopperSwiftUIandRealm
//
//  Created by ramil on 16.12.2020.
//

import Foundation
import RealmSwift

class RealmPersistence {
    static func initializer() -> Realm {
        do {
            let realm = try Realm()
            return realm
        } catch let err {
            fatalError("Failed to open Realm error: \(err.localizedDescription)")
        }
    }
}
