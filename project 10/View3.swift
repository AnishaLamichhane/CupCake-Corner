//
//  View3.swift
//  project 10
//
//  Created by Anisha Lamichhane on 5/29/21.
//

import SwiftUI

struct View3: View {
    @State var username = ""
    @State private var email = ""
    
    var disabledForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email:", text: $email)
            }
            
            Section {
                Button("Create new account") {
                    print("Creating new account")
                }
                .disabled(disabledForm)
            }
        }
    }
}

struct View3_Previews: PreviewProvider {
    static var previews: some View {
        View3()
    }
}
