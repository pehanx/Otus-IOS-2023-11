//
//  NetworkManager.swift
//
//
//  Created by Nikita Spekhin on 21.02.2024.
//

import Foundation

public final class NetworkManager {
    public static let shared = NetworkManager()
    private init(){}
    
    public func baseGetRequest<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void){
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let result = data {
                let json = NSString(data: result, encoding: String.Encoding.utf8.rawValue)
                print("JSON: json - ", json)
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
