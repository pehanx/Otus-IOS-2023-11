//
//  NewsViewModel.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import SwiftUI
import OtusNetworkingCore

class NewsViewModel: ObservableObject, BaseViewModelProtocol {
    typealias Item = Article
    @Injected var network: NetworkService?
    @Published var currentPage: Int = 1
    @Published var items: [Article] = []
    @State var isLoading: Bool = false
    
    private lazy var fromDate: String = getFromDate()
    private var newsResponse: NewsResponse?
    
    init() {
        isLoading = true
        fetchItems()
    }
    
    func isCanLoadMore(for item: Article) -> Bool {
        guard
            !isLoading,
            newsResponse != nil,
            items.isLastItem(item)
        else { return false }
        return true
    }
    
    func loadMore() {
        isLoading = true
        currentPage += 1
        getNews(page: currentPage, from: fromDate) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                self?.items.append(contentsOf: response.articles)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchItems() {
        getNews(page: currentPage, from: fromDate) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                self?.newsResponse = response
                self?.items = response.articles
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getNews(page:Int, from: String, completion: @escaping (Result<NewsResponse, Error>) -> Void) {
        let url = "https://newsapi.org/v2/everything?q=tesla&from=\(from)&sortBy=publishedAt&apiKey=ea7168fe47b7485d90047b96ac1bf7a8&pageSize=10&page=\(page)"
        network?.baseGetRequest(urlString: url, completion: completion)
    }
    
    private func getFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = Calendar.current.date(byAdding: .day, value: -2, to: Date()) {
            return dateFormatter.string(from: date)
        }
        return dateFormatter.string(from: Date())
    }
}
