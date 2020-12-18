//
//  CharacterDetailViewController.swift
//  StarWarsCharacters
//
//  Created by Field Employee on 12/18/20.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    
    var sw :SWResults!
    var vc = ViewController()
    @IBOutlet weak var detailNameLabel: UILabel!
    
    @IBOutlet weak var detailHomeWorldLabel: UILabel!
    @IBOutlet weak var detailHairColorLabel: UILabel!
    @IBOutlet weak var detailEyeColorLabel: UILabel!
    @IBOutlet weak var detailRankLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swArray = self.sw.results[0]
        self.detailNameLabel.text = swArray.name
        self.detailEyeColorLabel.text = swArray.eyeColor
        self.detailHairColorLabel.text = swArray.hairColor
        self.detailHomeWorldLabel.text = swArray.homeWorld
    }
    

}
