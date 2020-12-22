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

    @IBOutlet weak var detailAttunementLabel: UILabel!
    
    var name: String = ""
    var eyeColor: String = ""
    var hairColor: String = ""
    var rank: String = ""
    var planet: String = ""
    var attunement: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailNameLabel.text = self.name
        self.detailEyeColorLabel.text = "Eye Color: \(self.eyeColor)"
        self.detailHairColorLabel.text = "Hair Color: \(self.hairColor)"
        self.detailHomeWorldLabel.text = "Home World: \(self.planet)"
        self.detailRankLabel.text = "Rank: \(rank)"
        self.detailAttunementLabel.text = "Attunement: \(self.attunement)"
        
        
        switch eyeColor{
        case "blue":
            detailEyeColorLabel.textColor = .blue
            break
        case "red":
            detailEyeColorLabel.textColor = .red
            break
        case "yellow":
            detailEyeColorLabel.textColor = .yellow
            break
        case "brown":
            detailEyeColorLabel.textColor = .brown
            break
        case "blue-gray":
            detailEyeColorLabel.textColor = .gray
            break
        default:
            "No Eyes"
        }
        switch attunement{
        case "Light Side":
            detailNameLabel.backgroundColor = .systemBlue
            break
        case "Dark Side":
            detailNameLabel.backgroundColor = .red
            break
        case "Neutral":
            detailNameLabel.backgroundColor = .systemGray
        default:
            "No attunement"
        }
    }
        
}

