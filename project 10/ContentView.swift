//
//  ContentView.swift
//  project 10
//
//  Created by Anisha Lamichhane on 5/28/21.
//

import SwiftUI

struct ContentView: View {
//    We can now create a single instance of  order class inside ContentView by adding this property:
    @ObservedObject var newOrder  = observableOrder(order: NewOrder())
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type:", selection: $newOrder.order.type) {
                        ForEach (0 ..< Order.types.count) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(value: $newOrder.order.quantity, in: 3...20 ){
                        Text("Number of cakes: \(newOrder.order.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $newOrder.order.specialRequestEnabled.animation()) {
                        Text("Any special requests ?")
                    }
                    
                    if newOrder.order.specialRequestEnabled {
                        Toggle(isOn: $newOrder.order.extraFrosting) {
                        Text("Add extra frosting")
                        }
                    
                        Toggle(isOn: $newOrder.order.addSprinkles) {
                        Text("Add extra sprinkles ?")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(newOrder: newOrder)) {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationBarTitle("CupCake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
