//
//  RecipeViewController.swift
//  faseUm
//
//  Created by Leonardo Malheiros de Mello on 14/04/20.
//  Copyright © 2020 Leonardo Malheiros de Mello. All rights reserved.
//

import UIKit
import Firebase

class RecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ref = Database.database().reference()
    
     @IBOutlet weak var receitaTbl: UITableView!
    
    var receitaList = [Receita]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        receitaTbl.delegate = self
        receitaTbl.dataSource = self
        conecta()
    }

    public func conecta(){
        
            ref.observe(DataEventType.value) { (snap) in
                if snap.childrenCount > 0 {
                    
                    for receitas in snap.children.allObjects as! [DataSnapshot]{
                        let receitaObject = receitas.value as! [String : AnyObject]
                        
                        let receitaIngrediente = receitaObject["Ingredientes"]
                        let receitaNome = receitaObject["Nome"]
                        let receitaTipo = receitaObject["Tipo"]
                        
                        let recipe = Receita(nome: receitaNome as! String?, tipo: receitaTipo as! String?, ingredientes: receitaIngrediente as! String?)
                        
                        self.receitaList.append(recipe)
                    }
                    
                    self.receitaTbl.reloadData()

                } else {
                    print ("Não tem nada")
                }
                
            }

    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                 return receitaList.count
             }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReceitaTableViewCell

        let receita: Receita
        
        receita = receitaList[indexPath.row]
        
        cell.nomeLbl.text = receita.nome
        cell.tipoLbl.text = receita.tipo
        cell.ingredLbl.text = receita.ingredientes
        
        return cell
    }

}
