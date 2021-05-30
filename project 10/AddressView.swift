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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
