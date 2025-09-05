//
//  NetworkManager.swift
//  HackerNews_MVVM
//
//  Created by Koushik Reddy Kambham on 9/5/25.
//

import Foundation

protocol Network {
    func getData(from serverUrl: String, closure: @escaping (NewsList?) -> Void)
}

class NetworkManager: Network {
    static let shared = NetworkManager()

    func getData(from serverUrl: String, closure: @escaping (NewsList?) -> Void) {

        guard let serverURL = URL(string: serverUrl) else {
            print("Server URL is invalid")
            return
        }
        
       // fetch the data from the server
        let urlSession = URLSession.shared
        urlSession.dataTask(with: URLRequest(url: serverURL)) { data, response, error in
            
            // checking whether error fetchting the api
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            // wrapping the optional data to non optional
            guard let data = data else {
                print("No data returned from the server")
                return
            }
            
            // parsing the data to model
            do {
                let newsList = try JSONDecoder().decode(NewsList.self, from: data)
                closure(newsList)
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }.resume()
    }
}
