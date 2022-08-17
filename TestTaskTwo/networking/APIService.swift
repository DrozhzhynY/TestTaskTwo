//
//  APIService.swift
//  TestTaskTwo
//
//  Created by admin on 17.08.2022.
//

import Foundation



struct APIService {
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse,
                !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type.self, from: data)
                    completion(Result.success(result))
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func fetchMovies(url: URL?, completion: @escaping(Result<[Movie], APIError>) -> Void) {
        
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse,
                !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let movies = try decoder.decode(Initial.self, from: data)
                    completion(Result.success(movies.results))
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
