//
//  ViewController.swift
//  Networking
//
//  Created by Алексей Моторин on 19.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let urlString = "https://jsonplaceholder.typicode.com/posts/1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getRequestButtonTapped(_ sender: UIButton) {
        getRequest()
    }
    
    @IBAction func postRequestButtonTapped(_ sender: UIButton) {
    }
    
    private func getRequest() {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared
        let request = URLRequest(url: url)
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

