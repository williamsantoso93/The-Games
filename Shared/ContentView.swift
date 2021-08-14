//
//  ContentView.swift
//  Shared
//
//  Created by William Santoso on 11/08/21.
//

import SwiftUI

struct ContentView: View {
    @State private var iHello: Int = 0
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    CardView()
                    CardView()
                }
                .padding()
            }
            .navigationTitle("The Games")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        
                                    }) {
                                        Text("Button")
                                    }
            )
            
        }
    }
    
    func name() {
        print("hello world")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
