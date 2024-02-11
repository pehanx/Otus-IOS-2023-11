//
//  NewsView.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import SwiftUI
import CustomNavigationStack

struct NewsView: View {
    @EnvironmentObject var navigationViewModel: NavigationViewModel
    @ObservedObject var viewModel:NewsViewModel
    var body: some View {
        List(viewModel.articles) { article in
            VStack(alignment: .leading) {
                Text(article.title)
            }
            .onTapGesture {
                navigationViewModel.push(screenView: DetailNewsView(article))
            }
            .onAppear {
                if viewModel.isCanLoadMore(for: article) {
                    viewModel.loadMore()
                }
            }
        }
    }
}
