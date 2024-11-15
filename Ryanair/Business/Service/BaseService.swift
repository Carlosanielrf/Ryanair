//
//  BaseService.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Foundation
import Alamofire

protocol ServiceProtocol {
    func getData<T: Decodable>(
        url: String,
        parameters: Parameters?,
        type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    )
}

class BaseService: ServiceProtocol {
    
    let headers: HTTPHeaders = [
        "Accept-Encoding": "gzip, deflate, br",
        "Content-Type": "application/json",
        "client": "ios",
        "Client-Version": "3.999.0"
    ]
    private let decoder = JSONDecoder()
    
    func getData<T: Decodable>(
        url: String,
        parameters: Parameters? = nil,
        type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        AF.request(url, parameters: parameters, headers: headers)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    if let decoded = self.decode(type, from: data) {
                        completion(.success(decoded))
                    } else {
                        completion(.failure(NSError(domain: "DecodingError", code: -1, userInfo: nil)))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    private func decode<T: Decodable>(
        _ type: T.Type,
        from data: Data?
    ) -> T? {
        do {
            guard let data = data else { return nil }
            return try decoder.decode(type, from: data)
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}
