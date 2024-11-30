//
//  ContentView.swift
//  Calculatrice App
//
//  Created by Mac  on 28/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Grid {
                GridRow {
                    Button("one"){
                        print("one")
                    }
                    Button("one"){
                        print("one")
                    }
                    Button("one"){
                        print("one")
                    }
                }
                Divider()
                GridRow {
                    Button("one"){
                        print("one")
                    }
                    Button("one"){
                        print("one")
                    }
                    Button("one"){
                        print("one")
                    }
                }
            }
        }
        //.padding()
    }
}

#Preview {
    ContentView()
}
