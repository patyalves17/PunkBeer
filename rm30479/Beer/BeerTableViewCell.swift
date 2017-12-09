//
//  BeerTableViewCell.swift
//  rm30479
//
//  Created by ABC Education on 07/12/2017.
//  Copyright © 2017 PunkBeer. All rights reserved.
//

import UIKit
import Kingfisher

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbNome: UILabel!
    @IBOutlet weak var lbTeor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func fillCell(nome: String, teor: Double, imagem: String) {
        self.lbNome.text = nome
        self.lbTeor.text = "Teor alcoólico: \(teor)"
        self.ivImage.kf.setImage(with: URL(string: imagem))
    }
  
    
}
