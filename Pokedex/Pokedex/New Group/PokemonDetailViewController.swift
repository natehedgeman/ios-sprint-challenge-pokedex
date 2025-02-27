//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Nathan Hedgeman on 8/9/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    //Propeties
    var pokemonController: PokemonController?
    var pokemon: Pokemon?
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    //Labels
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var idDetailsLabel: UILabel!
    
    @IBOutlet weak var typesLabel: UILabel!
    @IBOutlet weak var typeDetailsLabel: UILabel!
    
    @IBOutlet weak var abilityLabel: UILabel!
    @IBOutlet weak var abilityDetailsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let pokemon = pokemon else { return }
        updateViews(with: pokemon)
    }

    func updateViews(with pokemon: Pokemon) {
        
        title = pokemon.name
        
        self.idLabel.text = "ID:"
        self.idDetailsLabel.text = "\(pokemon.id)"
        
        self.typesLabel.text = "Type:"
        self.typeDetailsLabel.text = pokemon.types.first?.type.name
        
        self.abilityLabel.text = "Abilities:"
        self.abilityDetailsLabel.text = pokemon.abilities.first?.ability.name
        
        pokemonController?.fetchImage(at: pokemon.sprites.frontDefault, completion: { (imageResult) in
            if let image = try? imageResult.get() {
                DispatchQueue.main.async {
                    self.pokemonImage.image = image
                }
                
            }
        })
    }
}
