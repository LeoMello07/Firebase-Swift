//
//  ReceitaTableViewCell.swift
//  faseUm
//
//  Created by Leonardo Malheiros de Mello on 14/04/20.
//  Copyright © 2020 Leonardo Malheiros de Mello. All rights reserved.
//

import UIKit
import Firebase

class ReceitaTableViewCell: UITableViewCell {
        
        
        @IBOutlet weak var nomeLbl: UILabel!
        @IBOutlet weak var tipoLbl: UILabel!
        @IBOutlet weak var ingredLbl: UILabel!
        
    override func awakeFromNib(){
        super.awakeFromNib()
        
        
    }
    
    override func setSelected ( _ selected : Bool, animated : Bool ) {
        super.setSelected(selected, animated: animated)
    }
       
}
