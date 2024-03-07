//
//  BeersViewModel.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import SwiftUI
import OtusNetworkingCore

class BeersViewModel: ObservableObject, BaseViewModelProtocol {
    typealias Item = Beer
    @Injected var network: NetworkService?
    @Published var currentPage: Int = 1
    @Published var items: [Beer] = []
    @State var isLoading: Bool = false
    
    init() {
        isLoading = true
        fetchItems()
    }
    
    func isCanLoadMore(for item: Beer) -> Bool {
        guard
            !isLoading,
            items.isLastItem(item)
        else { return false }
        return true
    }
    
    func loadMore() {
        isLoading = true
        currentPage += 1
        getBeers(page: currentPage) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                self?.items.append(contentsOf: response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchItems() {
        getBeers(page: currentPage) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                self?.items = response
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getBeers(page:Int, completion: @escaping (Result<BeersResponse, Error>) -> Void) {
        let url = "https://api.punkapi.com/v2/beers?page=\(page)&per_page=10"
        network?.baseGetRequest(urlString: url, completion: completion)
    }
}
