//
//  ListsView.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import SwiftUI
import CustomNavigationStack

struct ListsView: View {
    @EnvironmentObject var viewModel: NavigationViewModel
    @ObservedObject var listsViewModel = ListsViewModel()
    @ObservedObject var artworksViewModel = ArtworksViewModel()
    @ObservedObject var newsViewModel = NewsViewModel()
    @ObservedObject var beersViewModel = BeersViewModel()
    private var types = ListsType.allCases
    
    var body: some View {
        VStack {
            Picker(selection: $listsViewModel.selectedType, content: {
                ForEach(types, id: \.self) {
                    Text($0.rawValue)
                }
            }, label: {})
            .pickerStyle(.segmented)
            
            switch listsViewModel.selectedType {
            case .artworks:
                ArtworksView(viewModel: artworksViewModel)
            case .news:
                NewsView(viewModel: newsViewModel)
            case .beers:
                BeersView(viewModel: beersViewModel)
            }
        }
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        ListsView()
    }
}