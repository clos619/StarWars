//
//  ViewController.swift
//  StarWarsCharacters
//
//  Created by Field Employee on 12/18/20.
//

import UIKit

class ViewController: UIViewController {

    let starwarsAPI = "https://swapi.dev/api/people/"
    
    @IBOutlet weak var starWarsTableView: UITableView!
    var starWarsMain : [SWResults] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.starWarsTableView.dataSource = self
        self.starWarsTableView.delegate = self
        starWarsTableView.register(StarWarsTableViewCell.self, forCellReuseIdentifier: "Cell")
        getAllStarWarsDetails()
    }
    func getAllStarWarsDetails(){

        let group = DispatchGroup()
        for i in 1...10{
        group.enter()
        NetworkManager.shared.getDecodedObject(from: self.starwarsAPI) {
            (swChar: SWResults?, error) in
            guard let swChar = swChar else {return}
            self.starWarsMain.append(swChar)
            //print(self.starWarsMain)
            group.leave()
        }
    }
        group.notify(queue: .main){
            self.starWarsTableView.reloadData()
        }
        

    }

}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(self.clues[indexPath.row].answer)
        let storyboard = UIStoryboard(name: "Main", bundle:  nil)
        let swDetailScreen = storyboard.instantiateViewController(identifier: "CharacterDetailViewController") as! CharacterDetailViewController
        //swDetailScreen.label = self.starWarsMain[indexPath.row]
        self.navigationController?.pushViewController(swDetailScreen, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CharacterDetailViewController {
            destination.sw = starWarsMain[starWarsTableView.indexPathForSelectedRow!.row]
            
        }
    }
    
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWarsMain.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = starWarsTableView.dequeueReusableCell(withIdentifier: "StarWarsTableViewCell", for: indexPath) as! StarWarsTableViewCell
        let cell = starWarsTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let sw = self.starWarsMain[indexPath.row].results[indexPath.row]
        cell.textLabel?.text = sw.name

        //cell.configure(with: self.starWarsMain[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }


}

