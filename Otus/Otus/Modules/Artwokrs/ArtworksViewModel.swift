//
//  ArtworksViewModel.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import SwiftUI
import OtusNetworkingCore

class ArtworksViewModel: ObservableObject, BaseViewModelProtocol {
    typealias Item = Artwork
    @Injected var network: NetworkService?
    @Published var currentPage: Int = 1
    @Published var items: [Artwork] = []
    @State var isLoading: Bool = false
    private var artworksResponse: ArtworksResponse?
    
    init() {
        isLoading = true
        fetchItems()
    }
    
    func isCanLoadMore(for item: Artwork) -> Bool {
        guard
            !isLoading,
            let artworksResponse = artworksResponse,
            items.isLastItem(item)
        else { return false }
        return currentPage <= artworksResponse.pagination.totalPages
    }
    
    func loadMore() {
        isLoading = true
        currentPage += 1
        getArtworks(page: currentPage) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                self?.items.append(contentsOf: response.data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchItems() {
        getArtworks(page: currentPage) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                self?.artworksResponse = response
                self?.items = response.data
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getArtworks(page:Int, completion: @escaping (Result<ArtworksResponse, Error>) -> Void) {
        let url = "https://api.artic.edu/api/v1/artworks?limit=10&page=\(page)"
        network?.baseGetRequest(urlString: url, completion: completion)
    }
}
