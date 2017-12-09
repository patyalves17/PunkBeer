//
//  RestAPI.swift
//  rm30479
//
//  Created by ABC Education on 07/12/2017.
//  Copyright © 2017 PunkBeer. All rights reserved.
//

import Foundation
import UIKit

class RestAPI {
    
    // Punk API Base URL to get all beers
    static let baseURL = "https://api.punkapi.com/v2/"
    
    // Static function that loads all beers for the table view controller
    static func getBeers(page: Int = 1,
                         results: Int = 40,
                         onSuccess: @escaping ([Beer]) -> Void,
                         onFailure: @escaping (Error) -> Void) {
        
        // Building URL
        let url = URL(string: "\(baseURL)/beers?page=\(page)&per_page=\(results)")!
        
        // Initializating dataTask
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Guarding errors
            if error != nil {
                onFailure(error!)
            }
            
            // If there is no error application may parse the json
            if let resultData = data {
                do {
                    // Parsing data to json
                    let json = try JSONSerialization.jsonObject(with: resultData, options: .allowFragments) as! [[String:Any]]
                    
                    var list = [Beer]()
                    
                    for beerJson in json {
                        
                        let beer = Beer.init(id: beerJson["id"] as? Int ?? 0,
                                             nome: beerJson["name"] as? String ?? "",
                                             tag: beerJson["tagline"] as? String ?? "",
                                             descricao: beerJson["description"] as? String ?? "",
                                             teor: beerJson["abv"] as? Double ?? 0.0,
                                             amargura: beerJson["ibu"] as? Double ?? 0.0,
                                             imagemURL: beerJson["image_url"] as? String ?? "")
                        
                        list.append(beer)
                        
                    }
                    
                    // On successs the list of beers is returned
                    onSuccess(list)
                    
                } catch let e {
                    print("Error while parsing JSON: \(e.localizedDescription)")
                }
                
            }
        }
        
        task.resume()
        
    }
    
    
}
