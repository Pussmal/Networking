//
//  ViewController.swift
//  Networking
//
//  Created by Алексей Моторин on 19.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let urlStringGet = "https://jsonplaceholder.typicode.com/posts/1"
    private let urlStringPost = "https://jsonplaceholder.typicode.com/posts"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getRequestButtonTapped(_ sender: UIButton) {
        getRequest()
    }
    
    @IBAction func postRequestButtonTapped(_ sender: UIButton) {
        postRequest()
    }
    
    private func getRequest() {
        guard let url = URL(string: urlStringGet) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        resumeDataTask(request: request)
    }
    
    private func postRequest() {
        guard let url = URL(string: urlStringPost) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let userBody = ["Alexey" : "age: 32", "Lesson" : "GET and POST request"]
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userBody) else { return }
        request.httpBody = httpBody
        
        resumeDataTask(request: request)
       
    }
    
    private func resumeDataTask(request: URLRequest) {
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
}

