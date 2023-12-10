//
//  SecondView.swift
//  OTUS
//
//  Created by Nikita Spekhin on 10.12.2023.
//

import SwiftUI

struct SecondView: View {
    @Binding var rowChoice: Int?
    var body: some View {
        NavigationView {
            List {
                ForEach((1...10), id: \.self) { value in
                    NavigationLink(tag: value, selection: $rowChoice) {
                        Text("\(value) subelement")
                    } label: {
                        Text("\(value) element")
                    }
                }
            }
            .navigationTitle("Select element")
        }
    }
}
