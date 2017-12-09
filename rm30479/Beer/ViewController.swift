//
//  ViewController.swift
//  rm30479
//
//  Created by ABC Education on 07/12/2017.
//  Copyright © 2017 PunkBeer. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet weak var lbNome: UILabel!
    @IBOutlet weak var lbTag: UILabel!
    @IBOutlet weak var lbDescricao: UILabel!
    @IBOutlet weak var lbTeor: UILabel!
    @IBOutlet weak var lbAmargura: UILabel!
    @IBOutlet weak var ivImagem: UIImageView!
    
     var beer: Beer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        guard let beer = self.beer else {
            return
        }
        
        lbNome.text = beer.nome
        lbTag.text = beer.tag
        lbDescricao.text = beer.descricao
        lbTeor.text = "\(beer.teor ?? 0  )"
        lbAmargura.text = "\(beer.amargura ?? 0  )"
        
        ivImagem.kf.setImage(with: URL(string: beer.imageURL!))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

