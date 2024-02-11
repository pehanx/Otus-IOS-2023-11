//
//  BeersViewModel.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import SwiftUI

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
        NetworkManager.shared.getBeers(page: currentPage) { [weak self] result in
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
        NetworkManager.shared.getBeers(page: currentPage) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                self?.beers.append(contentsOf: response)
            case .failure(let error):
                print(error)
            }
        }
    }
}
