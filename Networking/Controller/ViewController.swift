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
        Networking.getRequest(url: urlStringGet)
    }
    
    @IBAction func postRequestButtonTapped(_ sender: UIButton) {
        Networking.postRequest(url: urlStringPost)
    }
        
    
}

