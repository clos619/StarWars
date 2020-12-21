//
//  CharacterDetailViewController.swift
//  StarWarsCharacters
//
//  Created by Field Employee on 12/18/20.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    
    var sw :SWResults!
    
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailHomeWorldLabel: UILabel!
    @IBOutlet weak var detailHairColorLabel: UILabel!
    @IBOutlet weak var detailEyeColorLabel: UILabel!
    @IBOutlet weak var detailRankLabel: UILabel!
    
    
    var name: String = ""
    var eyeColor: String = ""
    var hairColor: String = ""
    var rank: String = ""
    var planet: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailNameLabel.text = self.name
        self.detailEyeColorLabel.text = self.eyeColor
        self.detailHairColorLabel.text = self.hairColor
        self.detailHomeWorldLabel.text = self.planet
        
        self.detailRankLabel.text = rank
        
    }
}
