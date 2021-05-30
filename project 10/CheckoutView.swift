//
//  CheckoutView.swift
//  project 10
//
//  Created by Anisha Lamichhane on 5/30/21.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("Your cost is $\(self.order.cost, specifier: "%.2f")")
                        .font(.title)
                        .padding()
                    
                    Button ("Place Order") {
//                        place the order
                    }
                    .padding()
                }
            }
            
        }
        .navigationBarTitle("Checkout", displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
