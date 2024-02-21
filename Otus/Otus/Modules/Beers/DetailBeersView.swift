//
//  DetailBeersView.swift
//  Otus
//
//  Created by Nikita Spekhin on 11.02.2024.
//

import SwiftUI
import CustomNavigationStack
import OtusUI

struct DetailBeersView: View {
    @EnvironmentObject var viewModel: NavigationViewModel
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    var beer: Beer
    
    init(_ beer: Beer) {
        self.beer = beer
        imageLoader = ImageLoader(urlString: beer.imageURL)
    }
    
    var body: some View {
        VStack {
            NavigationBack {
                viewModel.pop()
            }
            VStack(alignment: .leading, spacing: 8) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onReceive(imageLoader.didChange) { data in
                        self.image = UIImage(data: data) ?? UIImage()
                    }
                Text(beer.name)
                    .font(.headline)
                Text(beer.description)
                    .font(.subheadline)
            }.padding(.horizontal, 16)
            Spacer()
        }
    }
}
