//
//  Networking.swift
//  Networking
//
//  Created by Алексей Моторин on 20.10.2022.
//

import Foundation
import UIKit

class Networking {

    static func getRequest(url: String) {
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
       
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard let response = response, let data = data else { return}
            
            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    static func postRequest(url: String) {
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let userBody = ["Alexey" : "age: 32", "Lesson" : "GET and POST request"]
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userBody) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard let response = response, let data = data else { return}
            
            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
            } catch let error {
                print(error)
            }
        }.resume()
       
    }
    
    static func downloadImage(url: String, completion: @escaping (_ image: UIImage)->() ) {
        guard let url = URL(string: url) else { return }
        let session = URLSession(configuration: .default)
        let request = URLRequest(url: url)
        session.dataTask(with: request) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }.resume()
    }

    
    static func fetchData(url: String, complition: @escaping ([Character])->()) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            let decodable = JSONDecoder()
            do {
                let characters = try decodable.decode([Character].self, from: data)

                DispatchQueue.main.async {
                    complition(characters)
                }
            } catch let error {
                print(error)
            }

        }.resume()
    }

}
