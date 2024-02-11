//
//  ProductView.swift
//  NavTest
//
//  Created by Nikolai Baklanov on 11.12.2023.
//

import SwiftUI

struct ProductView: View {
    let product: Product

    var body: some View {
        VStack {
            Text("Here is product: \(product.name)")
        }
        .navigationBarBackButtonHidden(false)
    }
}
