//
//  ShoppingItemListView.swift
//  GroceryShopperSwiftUIandRealm
//
//  Created by ramil on 17.12.2020.
//

import SwiftUI

struct ShoppingItemListView: View {
    @EnvironmentObject var store: ShoppingStore
    @State private var shoppingFormPressented = false
    let items: [ShoppingItem]
    let boughtItems: [ShoppingItem]
    
    var body: some View {
        List {
            Section(header: Text("Items to shop")) {
                if items.isEmpty {
                    Text("Add some shopping items before you go to grocery shopping")
                        .foregroundColor(.gray)
                }
                ForEach(items) { item in
                    ShoppingItemRow(shoppingItem: item)
                }
                
                newItemButton
            }
            
            Section(header: Text("Already in cart")) {
                if boughtItems.isEmpty {
                    Text("Buy something and it will show up here")
                }
                ForEach(boughtItems) { item in
                    ShoppingItemRow(shoppingItem: item)
                }.onDelete { indexSet in
                    if let idx = indexSet.first {
                        store.delete(itemId: boughtItems[idx].id)
                    }
                }
            }
        }.listStyle(GroupedListStyle())
        .navigationBarTitle("Grocery Shopper")
    }
    
    var newItemButton: some View {
        Button {
            shoppingFormPressented.toggle()
        } label: {
            HStack {
                Image(systemName: "plus.circle.fill")
                Text("Add New Item")
                    .bold()
            }
        }
        .foregroundColor(.orange)
        .sheet(isPresented: $shoppingFormPressented) {
            ShoppingFormView(form: ShoppingForm())
                .environmentObject(store)
        }
    }
}
