//
//  ArtworksViewModel.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import SwiftUI

class ArtworksViewModel: ObservableObject {
    @Published var currentPage:Int = 1
    @Published var artworks = [Artwork]()
    @State var isLoading: Bool = false
    private var artworksResponse: ArtworksResponse?
    
    init() {
        isLoading = true
        fetchArtworks()
    }
    
    func isCanLoadMore(for item: Artwork) -> Bool {
        guard
            !isLoading,
            let artworksResponse = artworksResponse,
            artworks.isLastItem(item)
        else { return false }
        return currentPage <= artworksResponse.pagination.totalPages
    }
    
    private func fetchArtworks() {
        NetworkManager.shared.getArtworks(page: currentPage) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                self?.artworksResponse = response
                self?.artworks = response.data
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadMore() {
        isLoading = true
        currentPage += 1
        NetworkManager.shared.getArtworks(page: currentPage) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                self?.artworks.append(contentsOf: response.data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
