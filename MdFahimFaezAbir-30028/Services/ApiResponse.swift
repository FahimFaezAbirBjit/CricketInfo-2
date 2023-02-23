//
//  ApiResponse.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 13/2/23.
//

import Foundation
class ApiResponse {
    static let shared = ApiResponse()
    private init() {}
    let cache = NSCache<NSString, NSData>()
    func getApiData<T: Codable>(url: String, completion: @escaping (Result<T?, Error>) -> Void) {
        print(url)
        guard let url = URL(string: url) else { return }
        print(url)
        if let cachedData = cache.object(forKey: url.absoluteString as NSString) as Data?,
           let result = try? JSONDecoder().decode(T.self, from: cachedData) {
            completion(.success(result))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Server Not found \(error.localizedDescription)")
            } else {
                guard let data = data else {
                    let error = NSError(domain: "No data received", code: 0, userInfo: nil)
                    completion(.failure(error))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(
                        T.self, from: data
                    )
                     self.cache.setObject(data as NSData, forKey: url.absoluteString as NSString)
                    completion(.success(result))
                    //  dump(result)
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
