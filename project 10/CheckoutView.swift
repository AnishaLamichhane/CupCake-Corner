//
//  CheckoutView.swift
//  project 10
//
//  Created by Anisha Lamichhane on 5/30/21.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    @State private var conformationMessage = ""
    @State private var showingConformation = false
    
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
                        placeOrder()
                    }
                    .padding()
                }
            }
            
        }
        .navigationBarTitle("Checkout", displayMode: .inline)
        .alert(isPresented: $showingConformation){
            Alert(title: Text("Thank You"), message: Text(conformationMessage), dismissButton: .default(Text("Okay")))
        }
    }
    
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("failed to encode items")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "Post"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request){ data, resopnse, error in
            guard let data = data else {
                print("No data in response \(error?.localizedDescription ?? "Unknown Error").")
                return
            }
            
            if let decodedOrder  = try? JSONDecoder().decode(Order.self, from: data) {
                self.conformationMessage = "Your order for \(decodedOrder.quantity) * \(Order.types[decodedOrder.type].lowercased()) cupcakes in on the way."
                self.showingConformation = true
            } else {
                print("Invalid response from the server.")
            }
        }.resume()
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
