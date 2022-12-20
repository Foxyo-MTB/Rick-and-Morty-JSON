//
//  DataManager.swift
//  JSON_Rick_and_Morty
//
//  Created by Vladimir Beliakov on 19.09.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    var character: DataModel?
    
    //let rickURL = "https://rickandmortyapi.com/api/character"
    
    func fetchRick(page: Int, handler: @escaping ((DataModel) -> Void)) {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/character?page=\(page)") else { return }
        
        URLSession.shared.dataTask(with: url) { [self] data, _, _ in
            
            guard let data = data else { return }
            
            do {
                self.character = try JSONDecoder().decode(DataModel.self, from: data)
                handler(self.character!)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
