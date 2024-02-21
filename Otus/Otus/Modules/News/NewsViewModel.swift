//
//  NewsViewModel.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import SwiftUI
import OtusNetworkingCore

class NewsViewModel: ObservableObject {
    @Published var currentPage:Int = 1
    @Published var articles = [Article]()
    @State var isLoading: Bool = false
    private var newsResponse: NewsResponse?
    private lazy var fromDate: String = getFromDate()
    
    init() {
        isLoading = true
        fetchNews()
    }
    
    func isCanLoadMore(for item: Article) -> Bool {
        guard
            !isLoading,
            let newsResponse = newsResponse,
            articles.isLastItem(item)
        else { return false }
        return true
    }
    
    private func fetchNews() {
        getNews(page: currentPage, from: fromDate) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                self?.newsResponse = response
                self?.articles = response.articles
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadMore() {
        isLoading = true
        currentPage += 1
        getNews(page: currentPage, from: fromDate) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                self?.articles.append(contentsOf: response.articles)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = Calendar.current.date(byAdding: .day, value: -2, to: Date()) {
            return dateFormatter.string(from: date)
        }
        return dateFormatter.string(from: Date())
    }
    
    func getNews(page:Int, from: String, completion: @escaping (Result<NewsResponse, Error>) -> Void) {
        let url = "https://newsapi.org/v2/everything?q=tesla&from=\(from)&sortBy=publishedAt&apiKey=ea7168fe47b7485d90047b96ac1bf7a8&pageSize=10&page=\(page)"
        NetworkManager.shared.baseGetRequest(urlString: url, completion: completion)
    }
}
