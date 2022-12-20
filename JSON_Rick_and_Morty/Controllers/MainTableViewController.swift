//
//  MainTableViewController.swift
//  JSON_Rick_and_Morty
//
//  Created by Vladimir Beliakov on 19.09.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let dataManager = DataManager()
    var data = [Results]()
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }
    
    private func fetch() {
        self.dataManager.fetchRick(page: page) { data in
            DispatchQueue.main.async {
                self.page += 1
                self.data += data.results
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == data.count - 1 {
            fetch()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let detailVC = segue.destination as! DetailViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                detailVC.character = data[indexPath.row]
            }
        }
        if segue.identifier == "" {
        }
    }
}
