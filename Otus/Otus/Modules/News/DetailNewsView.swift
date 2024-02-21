//
//  DetailNewsView.swift
//  Otus
//
//  Created by Nikita Spekhin on 11.02.2024.
//

import SwiftUI
import CustomNavigationStack
import OtusUI

struct DetailNewsView: View {
    @EnvironmentObject var viewModel: NavigationViewModel
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    var article: Article
    
    init(_ article: Article) {
        self.article = article
        imageLoader = ImageLoader(urlString: article.urlToImage ?? "")
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
                Text(article.title)
                    .font(.headline)
                Text(article.content)
                    .font(.caption)
            }.padding(.horizontal, 16)
            Spacer()
        }
        
    }
}

