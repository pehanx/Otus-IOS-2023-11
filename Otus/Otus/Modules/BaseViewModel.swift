//
//  BaseViewModel.swift
//  Otus
//
//  Created by Nikita Spekhin on 07.03.2024.
//

import SwiftUI
import OtusNetworkingCore

protocol BaseViewModelProtocol {
    associatedtype Item
    var network: NetworkService? { get set }
    var currentPage: Int { get set }
    var items: [Item] { get set } 
    var isLoading: Bool { get set }
    func fetchItems()
    func loadMore()
    func isCanLoadMore(for item: Item) -> Bool
}
