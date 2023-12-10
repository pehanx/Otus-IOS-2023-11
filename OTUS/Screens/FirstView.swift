//
//  FirstView.swift
//  OTUS
//
//  Created by Nikita Spekhin on 10.12.2023.
//

import SwiftUI

struct FirstView: View {
    @Binding var tabSelection: Int
    @Binding var rowChoice: Int?
    var body: some View {
        VStack {
            Text("FirstView")
                .padding()
            Button {
                self.tabSelection = 1
                self.rowChoice = Int.random(in: 1...10)
            } label: {
                Text("Show second view")
            }
        }
        
    }
}
