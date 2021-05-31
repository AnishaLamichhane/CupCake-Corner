//
//  CheckoutView.swift
//  project 10
//
//  Created by Anisha Lamichhane on 5/30/21.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
//    challege 2
    @State private var alertMessage = ""
    
    @State private var alertTitle = ""
    @State private var showingAlert = false
    
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
        .alert(isPresented: $showingAlert){
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Okay")))
        }
    }
    
    //            challlenge 2
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order) else {

            self.alertTitle = "Oops!"
            self.alertMessage = "failed to encode items."
            self.showingAlert = true
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "Post"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request){ data, resopnse, error in
            guard let data = data else {
                self.alertTitle = "Oops!"
//                this part is actually seen in alert if wifi is off
                self.alertMessage = "\(error?.localizedDescription ?? "Unknown Error")."
                self.showingAlert = true
                return
            }
            
            
            if let decodedOrder  = try? JSONDecoder().decode(Order.self, from: data) {
                self.alertTitle = "Thank You!"
                self.alertMessage = "Your order for \(decodedOrder.quantity) * \(Order.types[decodedOrder.type].lowercased()) cupcakes in on the way."
                self.showingAlert = true
            } else {
                self.alertTitle = "Oops!"
                self.alertMessage = " Invalid response from the server"
                self.showingAlert = true
            }
        }.resume()
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
