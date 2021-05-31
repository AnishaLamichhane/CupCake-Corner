//
//  AddressView.swift
//  project 10
//
//  Created by Anisha Lamichhane on 5/30/21.
//

import SwiftUI

struct AddressView: View {
//    this is a property
    @ObservedObject var newOrder: observableOrder
    
    
    var body: some View {
        Form {
            Section {
                TextField("Name:", text: $newOrder.order.name)
                TextField("Street Address", text: $newOrder.order.streetAddress)
                TextField("City", text: $newOrder.order.city)
                TextField("Zip:", text: $newOrder.order.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(newOrder: newOrder)) {
                    Text("Check OUT")
                }
            }
            .disabled(newOrder.order.hasValidAddress == false)
        }
        .navigationBarTitle("Delivery Details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(newOrder: observableOrder(order: NewOrder()))
    }
}
