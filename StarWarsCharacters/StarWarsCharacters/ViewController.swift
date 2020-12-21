//
//  ViewController.swift
//  StarWarsCharacters
//
//  Created by Field Employee on 12/18/20.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var starWarsTableView: UITableView!
    var starWarsMain : [SWResults] = []
    var starWarsHomeWorld : [HomeWorld] = []
    var starWarsPlanets : [String] = []
    let eyecolor: String = ""
    let starwarsAPI = "https://swapi.dev/api/people/"
    var rank : [String] = [" Jedi Master"," Droid"," Droid"," Sith Lord"," Senator"," Farmer"," Farmer"," Droid"," Unknown"," Jedi Master"]
    var worlds : [String] = []
    var homeWorld: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.starWarsTableView.dataSource = self
        self.starWarsTableView.delegate = self
        starWarsTableView.register(StarWarsTableViewCell.self, forCellReuseIdentifier: "StarWarsTableViewCell")
        getAllStarWarsDetails()
        getHomePlanet()
        
    }
    func getAllStarWarsDetails(){

        let group = DispatchGroup()
        for i in 1...10{
        group.enter()
        NetworkManager.shared.getDecodedObject(from: self.starwarsAPI) {
            (swChar: SWResults?, error) in
            guard let swChar = swChar else {return}
            self.starWarsMain.append(swChar)
            //print(self.starWarsMain[0].results[0].homeWorld)
            for i in 1...9{
                self.starWarsPlanets.append(self.starWarsMain[0].results[i].homeWorld)
                //print(self.starWarsPlanets)
            }
            
            group.leave()
            
        }
            
    }
        group.notify(queue: .main){
            self.starWarsTableView.reloadData()
        }
    }
    func getHomePlanet(){
        let group = DispatchGroup()
        for planet in starWarsPlanets{
            let homeworldAPI = planet
            //print(planet)
            group.enter()
            NetworkManager.shared.getDecodedObject(from: homeworldAPI){
                (homeworld: HomeWorld?,error) in
                guard let homeworld = homeworld else{return}
                self.starWarsHomeWorld.append(homeworld)
                print(self.starWarsHomeWorld)
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
        let storyboard = UIStoryboard(name: "Main", bundle:  nil)
        let swDetailScreen = storyboard.instantiateViewController(identifier: "CharacterDetailViewController") as! CharacterDetailViewController
       
       
        swDetailScreen.name = starWarsMain[indexPath.row].results[indexPath.row].name
        swDetailScreen.eyeColor = starWarsMain[indexPath.row].results[indexPath.row].eyeColor
        swDetailScreen.hairColor = starWarsMain[indexPath.row].results[indexPath.row].hairColor
        swDetailScreen.rank = rank[indexPath.row]
        homeWorld = starWarsMain[indexPath.row].results[indexPath.row].homeWorld
        
       //swDetailScreen.planet = starWarsHomeWorld[0].name
        self.navigationController?.pushViewController(swDetailScreen, animated: true)
        }
        
    }


extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWarsMain.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = starWarsTableView.dequeueReusableCell(withIdentifier: "StarWarsTableViewCell", for: indexPath) as! StarWarsTableViewCell
        let sw = self.starWarsMain[indexPath.row].results[indexPath.row]
        //cell.configure(with: self.starWarsMain[indexPath.row])
        cell.textLabel?.text = sw.name

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }


}

