//
//  BeersTableViewController.swift
//  rm30479
//
//  Created by ABC Education on 07/12/2017.
//  Copyright © 2017 PunkBeer. All rights reserved.
//

import UIKit

class BeersTableViewController: UITableViewController {

    var beers = [Beer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.carregaBeers()
        
    }
    
    func carregaBeers() {
        RestAPI.getBeers(onSuccess: { (result) in
            
            self.beers = result
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }) { (error) in
            print("Erro ao carregar as cervejas: \(error.localizedDescription)")
            // create the alert
            let alert = UIAlertController(title: "Erro", message: "Erro ao carregar as cervejas.", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "beerCell", for: indexPath) as! BeerTableViewCell
        
        let beer = beers[indexPath.row]
        
        cell.preenche(nome: beer.nome!, teor: beer.teor!, imagem: beer.imageURL!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "mostraBeer", sender: beers[indexPath.row])
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostraBeer" {
            if let beer = sender as? Beer {
                let beerViewController = segue.destination as! ViewController
                beerViewController.beer = beer
            }
        }
    }

}
