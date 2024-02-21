//
//  BeersViewModel.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import SwiftUI
import OtusNetworkingCore

class BeersViewModel: ObservableObject {
    @Published var currentPage:Int = 1
    @Published var beers = [Beer]()
    @State var isLoading: Bool = false
    
    init() {
        isLoading = true
        fetchBeers()
    }
    
    func isCanLoadMore(for item: Beer) -> Bool {
        guard
            !isLoading,
            beers.isLastItem(item)
        else { return false }
        return true
    }
    
    private func fetchBeers() {
        getBeers(page: currentPage) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                self?.beers = response
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadMore() {
        isLoading = true
        currentPage += 1
        getBeers(page: currentPage) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                self?.beers.append(contentsOf: response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getBeers(page:Int, completion: @escaping (Result<BeersResponse, Error>) -> Void) {
        let url = "https://api.punkapi.com/v2/beers?page=\(page)&per_page=10"
        NetworkManager.shared.baseGetRequest(urlString: url, completion: completion)
    }
}
