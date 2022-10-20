//
//  CustomTableViewCell.swift
//  Networking
//
//  Created by Алексей Моторин on 20.10.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var character: Character? {
        didSet {
            guard let character = character else { return }
            nameCharacterLabel.text = character.name
            genderCharacterLabel.text = character.gender.rawValue
            speciesCharacterLabel.text = character.species.rawValue
            
            DispatchQueue.global().async {
                guard let urlString = URL(string: character.image) else { return}
                guard let imageData = try? Data(contentsOf: urlString) else { return }
                
                DispatchQueue.main.async {
                    self.characterImageView.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameCharacterLabel: UILabel!
    @IBOutlet weak var speciesCharacterLabel: UILabel!
    @IBOutlet weak var genderCharacterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
