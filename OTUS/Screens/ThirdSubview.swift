//
//  ThirdSubview.swift
//  OTUS
//
//  Created by Nikita Spekhin on 10.12.2023.
//

import SwiftUI

struct ThirdSubview: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Modal view")
                .padding()
            Button {
                dismiss()
            } label: {
                Text("Hide")
            }
        }
    }
}

struct ThirdSubview_Previews: PreviewProvider {
    static var previews: some View {
        ThirdSubview()
    }
}
