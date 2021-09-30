//
//  BookListService.swift
//  KTBooks
//
//  Created by pttem-ios on 28.09.2021.
//

import Foundation

final class BookListService: BookListServiceProtocol {
    func getBookList(completion: @escaping (Result<BookListServiceResponse, NetworkError>) -> Void) {
        guard let url = URL(string: AppConstants.Url.books) else {
            completion(.failure(.invalidUrl))
            return
        }
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(. noData))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let object = try decoder.decode(BookListServiceResponse.self, from: data)
                completion(.success(object))
            } catch {
                completion(.failure(.invalidDecode))
            }
        }
        task.resume()
    }
}
