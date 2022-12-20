//
//  DetailViewController.swift
//  JSON_Rick_and_Morty
//
//  Created by Vladimir Beliakov on 20.09.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var nameOutlet: UILabel!
    @IBOutlet var statusOutlet: UILabel!
    @IBOutlet var speciesOutlet: UILabel!
    @IBOutlet var portraitOutlet: UIImageView!
    
    var character: Results!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        portraitOutlet.layer.cornerRadius = 100
        nameOutlet.text = character.name
        statusOutlet.text = character.status
        speciesOutlet.text = character.species
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let imageURL = URL(string: self.character.image) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                self.portraitOutlet?.image = UIImage(data: imageData)
            }
        }
    }
}
