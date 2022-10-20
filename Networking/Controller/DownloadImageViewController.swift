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
        
        Networking.downloadImage(url: imageURLString) { image in
            self.activityIndicator.stopAnimating()
            self.imageView.image = image
        }
    }
    
    deinit {
        print("DownloadImageViewController deinit")
    }
    
}
