//
//  DownloadImageViewController.swift
//  Networking
//
//  Created by Алексей Моторин on 19.10.2022.
//

import UIKit

class DownloadImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var infoLabel: UILabel!
    
    let imageURLString = "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/hubble_arp-madore608-333_potw2240a.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedScreen))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tappedScreen() {
        infoLabel.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        guard let url = URL(string: imageURLString) else { return }
        let session = URLSession(configuration: .default)
        let request = URLRequest(url: url)
        session.dataTask(with: request) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.imageView.image = image
                }
            }
        }.resume()
    }
    
    deinit {
        print("DownloadImageViewController deinit")
    }
    
}
