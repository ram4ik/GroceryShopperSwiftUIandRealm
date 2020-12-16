//
//  ShoppingItemDB.swift
//  GroceryShopperSwiftUIandRealm
//
//  Created by ramil on 16.12.2020.
//

import Foundation
import RealmSwift

class ShoppingItemDB: Object {
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var notes = ""
    @objc dynamic var quantity = 1
    @objc dynamic var bought = false
    
    override class func primaryKey() -> String? {
        "id"
    }
}
