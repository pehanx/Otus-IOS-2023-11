//
//  ThirdView.swift
//  OTUS
//
//  Created by Nikita Spekhin on 10.12.2023.
//

import SwiftUI

struct ThirdView: View {
    @State var isPresented = false
    var body: some View {
        VStack {
            Text("Profile")
                .padding()
            MainButton(title: "Show") {
                isPresented.toggle()
            }
        }
        .sheet(isPresented: $isPresented) {
            ThirdSubview()
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
