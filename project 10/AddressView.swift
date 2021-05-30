//
//  AddressView.swift
//  project 10
//
//  Created by Anisha Lamichhane on 5/30/21.
//

import SwiftUI

struct AddressView: View {
//    this is a property
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name:", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip:", text: $order.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check OUT")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationBarTitle("Delivery Details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
