//
//  NewOrder.swift
//  project 10
//
//  Created by Anisha Lamichhane on 5/31/21.
//

import Foundation
enum CodingKeys: CodingKey {
    case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
}

//challenge 3

class observableOrder: ObservableObject {
    @Published var order: NewOrder
    
    init(order: NewOrder) {
        self.order = order
    }
}

struct NewOrder: Codable {

    static let types = ["Vanilla", "Strawberry", "Chocolate" , "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
//    for address details
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
/*
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
*/
        
//        challenge 1
        if name.hasSpaces().isEmpty || streetAddress.hasSpaces().isEmpty || city.hasSpaces().isEmpty || zip.hasSpaces().isEmpty {
            return false
        }
       
        return true
    }
    
    
//    for cost of the cake
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2

        // complicated cakes cost more
        cost += (Double(type) / 2)

        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }

        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }
}

//Challenge 1
extension String {
    func hasSpaces() -> String{
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed
    }
}
