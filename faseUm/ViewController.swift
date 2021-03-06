//
//  ViewController.swift
//  faseUm
//
//  Created by Leonardo Malheiros de Mello on 12/03/20.
//  Copyright © 2020 Leonardo Malheiros de Mello. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    @IBOutlet weak var salvarBTN: UIButton!
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var tipoText: UITextField!
    @IBOutlet weak var ingredienteText: UITextField!
    
     let ref = Database.database().reference()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameText.delegate = self
        tipoText.delegate = self
        ingredienteText.delegate = self
        
    }
    
    @IBAction func clicaBotao(_ sender:UIButton!) {
        
        let receita = ["Nome" : nameText.text! as String, "Tipo" : tipoText.text! as String, "Ingredientes" : ingredienteText.text! as String]
          ref.childByAutoId().setValue(receita)
          ref.keepSynced(true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ingredienteText.resignFirstResponder()
    }
    
}

extension ViewController : UITextFieldDelegate {
     
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
}

