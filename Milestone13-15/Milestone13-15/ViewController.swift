//
//  ViewController.swift
//  Milestone13-15
//
//  Created by nikita on 15.02.2023.
//

import UIKit

class ViewController: UITableViewController {
    var countrys = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries"
        
        let urlString = "file:///Users/nikita/Downloads/Json%20countrys.json"
        
        if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    parse(json: data)
                }
            }

    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonCountrys = try? decoder.decode(Countrys.self, from: json) {
            countrys = jsonCountrys.CountrysResults
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countrys.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = countrys[indexPath.row]
        
        cell.textLabel?.text = petition.name
        cell.detailTextLabel?.text = petition.facts
            return cell
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.detailItem = countrys[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        
        }
   
    }
    


}

