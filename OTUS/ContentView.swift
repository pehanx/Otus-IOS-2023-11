//
//  ContentView.swift
//  OTUS
//
//  Created by Nikita Spekhin on 10.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 0
    @State private var rowChoice: Int?
    
    var body: some View {
        TabView(selection: $tabSelection) {
            FirstView(tabSelection: $tabSelection, rowChoice: $rowChoice)
                .tag(0)
                .tabItem {
                    Label("First", systemImage: "1.lane")
                }
            SecondView(rowChoice: $rowChoice)
                .tag(1)
                .tabItem {
                    Label("Second", systemImage: "2.lane")
                }
            ThirdView()
                .tag(2)
                .tabItem {
                    Label("Third", systemImage: "3.lane")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
