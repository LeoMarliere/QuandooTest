//
//  APIManager.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

protocol APIManagerProtocol: AnyObject {
    func fetchUserData(url: String, completion: @escaping([UserData]) -> Void)
}

class APIManager: APIManagerProtocol {
    
    func fetchUserData(url: String, completion: @escaping ([UserData]) -> Void) {
        
        guard let url = URL(string: url) else { return }
        var userDataList: [UserData] = []
       
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil || data == nil {
                print("Error while fetching data")
            } else if let data = data {
                userDataList = try! JSONDecoder().decode([UserData].self, from: data)
                completion(userDataList)
            }
        }
        task.resume()
    }
}