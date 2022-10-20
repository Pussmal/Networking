//
//  RickAndMortyTableViewController.swift
//  Networking
//
//  Created by Алексей Моторин on 20.10.2022.
//

import UIKit

class RickAndMortyTableViewController: UITableViewController {
    
    let urlString = "https://rickandmortyapi.com/api/character/1,2,3,%204,%205,%206,%207,%208,%209,%2010"
    var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Networking.fetchData(url: urlString) { characters in
            self.characters = characters
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}
        cell.selectionStyle = .none
        let character = characters[indexPath.row]
        cell.character = character
        return cell
    }

}
