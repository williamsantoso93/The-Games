//
//  ContentView.swift
//  Shared
//
//  Created by William Santoso on 11/08/21.
//

import SwiftUI

struct ContentView: View {
    let listGames = Bundle.main.decode(ListGames.self, from: "listGames.json")
    @State private var iHello: Int = 0
    var body: some View {
        NavigationView {
            Group {
                if let results = listGames.results {
                    ScrollView {
                        LazyVStack {
                            ForEach(results) { game in
                                CardView(game: game)
                            }
                        }
                        .padding()
                    }
                } else {
                    VStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                        
                        Text("Loading...")
                    }
                }
            }
            .navigationTitle("The Games")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        
                                    }) {
                                        Text("Profile")
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
