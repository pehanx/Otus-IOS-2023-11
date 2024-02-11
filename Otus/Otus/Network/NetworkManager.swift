//
//  NetworkManager.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init(){}
    
    func getArtworks(page:Int, completion: @escaping (Result<ArtworksResponse, Error>) -> Void) {
        let url = "https://api.artic.edu/api/v1/artworks?limit=10&page=\(page)"
        baseGetRequest(urlString: url, completion: completion)
    }
    
    func getNews(page:Int, from: String, completion: @escaping (Result<NewsResponse, Error>) -> Void) {
        let url = "https://newsapi.org/v2/everything?q=tesla&from=\(from)&sortBy=publishedAt&apiKey=ea7168fe47b7485d90047b96ac1bf7a8&pageSize=10&page=\(page)"
        baseGetRequest(urlString: url, completion: completion)
    }
    
    func getBeers(page:Int, completion: @escaping (Result<BeersResponse, Error>) -> Void) {
        let url = "https://api.punkapi.com/v2/beers?page=\(page)&per_page=10"
        baseGetRequest(urlString: url, completion: completion)
    }
    
    private func baseGetRequest<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void){
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let result = data {
                let json = NSString(data: result, encoding: String.Encoding.utf8.rawValue)
//                print("JSON: json - ", json)
            }
            
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                
                // success
                DispatchQueue.main.async {
                    completion(.success(objects))
                }
            } catch {
                dump(error)
                print("DEBUG: ERROR!", error.localizedDescription)
                debugPrint("DEBUG: ERROR!!!", error)
                completion(.failure(error))
            }
        }.resume()
    }
}
