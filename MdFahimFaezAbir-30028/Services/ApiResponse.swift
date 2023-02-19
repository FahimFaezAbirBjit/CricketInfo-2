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
    func getApiData<T: Codable>(url: String, completion: @escaping (Result<T?, Error>) -> Void) {
        print(url)
        guard let url = URL(string: url) else { return }
        print(url)
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Server Not found \(error.localizedDescription)")
            } else {
                guard let data = data else {
                    return
                }
                do {
                    let result = try JSONDecoder().decode(
                        T.self, from: data
                    )
                   // print(.success(result))
                    completion(.success(result))
                  //  dump(result)
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
