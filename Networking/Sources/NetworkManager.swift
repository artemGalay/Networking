//
//  NetworkManager.swift
//  Networking
//
//  Created by Артем Галай on 23.10.22.
//

import Foundation

class NetworkManager {

    func getAllPosts(_ complitionHandler: @escaping ([Post]) -> ()) {

        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("error: \(error.localizedDescription)")
            } else if let response = response as? HTTPURLResponse,
                      response.statusCode == 200,
                      let data = data {
                let posts = try? JSONDecoder().decode([Post].self, from: data)
                complitionHandler(posts ?? [])
            }
        }.resume()
    }
}
