//
//  View1.swift
//  project 10
//
//  Created by Anisha Lamichhane on 5/29/21.
//

import SwiftUI

class User: ObservableObject, Codable {
//    every case in our enum is the name of a property we want to load and save
    enum CodingKeys: CodingKey {
        case name
    }

    @Published var name = "somebody"
    
//    This initializer throws an error if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}


struct View1: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct View1_Previews: PreviewProvider {
    static var previews: some View {
        View1()
    }
}
