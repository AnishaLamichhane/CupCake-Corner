//
//  View2.swift
//  project 10
//
//  Created by Anisha Lamichhane on 5/29/21.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}


struct View2: View {
    @State private var results = [Result]()

    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
//            step 4
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // now we have a good data - go back to the main thread
                    DispatchQueue.main.async {
//                        update our UI
                        self.results = decodedResponse.results
                        
                    }
                    
//                    everything is good
                    return
                }
            }
            
            //    if we are still here it means it was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }

}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2()
    }
}
