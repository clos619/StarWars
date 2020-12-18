//
//  StarWarsTableViewCell.swift
//  StarWarsCharacters
//
//  Created by Field Employee on 12/18/20.
//

import UIKit

class StarWarsTableViewCell: UITableViewCell {

    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var rankArray : [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with sw: SWResults) {
        
        self.nameLabel.text = sw.results[0].name
        

        DispatchQueue.main.async {
            let vc = ViewController()
            vc.starWarsTableView?.reloadData()
        }
    }
}

