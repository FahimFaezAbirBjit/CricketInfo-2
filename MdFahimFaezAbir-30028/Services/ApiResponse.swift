////
////  ApiResponse.swift
////  MdFahimFaezAbir-30028
////
////  Created by Bjit on 13/2/23.
////
//
//import Foundation
//class ApiResponse {
//    static let shared = ApiResponse()
//    private init() {}
//    func getApiData(url: String, completion: @escaping (Result<T?, Error>) -> Void) {
//        guard let url = URL(string: url) else { return }
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                print("Server Not found \(error.localizedDescription)")
//            } else {
//                guard let data = data else {
//                    return
//                }
//                do {
//                    let result = try JSONDecoder().decode(
//                        Welcome.self, from: data
//                    )
//                    completion(.success(result))
//                } catch {
//                    completion(.failure(error))
//                }
//            }
//        }.resume()
//    }
//}
