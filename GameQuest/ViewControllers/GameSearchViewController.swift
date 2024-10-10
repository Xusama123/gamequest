//
//  ViewController.swift
//  GameQuest
//
//  Created by Usama Waked on 2024-10-10.
//

import UIKit

class GameSearchViewController: UIViewController {
    
    //MARK: Properties
    var games: [Game] = []

    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        if let bookURL = createGameURL(from: "shooter"){
            fetchGames(from: bookURL)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //MARK: - Datasource Methods and properties
    lazy var tableDataSource = UITableViewDiffableDataSource<Section, Game>(tableView: tableView){
        tableView, indexPath, itemIdentifier in
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as! GameTableViewCell
        
        cell.gameTitle.text = itemIdentifier.title
        cell.gamePublisher.text = itemIdentifier.publisher
        cell.gameDate.text = itemIdentifier.release_date
        
        return cell
    }
    
    //data snapshot to refresh tableview
    func createDataSnapshot(){
        var snapshot = NSDiffableDataSourceSnapshot<Section, Game>()
        snapshot.appendSections([.main])
        snapshot.appendItems(games)
        tableDataSource.apply(snapshot)
    }
    
    //https://www.mmobomb.com/api1/games?category=shooter
    
    //MARK: Fetch Games
    //get url for fetching api data
    func createGameURL(from searchString: String) -> URL? {
        guard let cleanURL = searchString.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else { return nil}
        var urlString = "https://www.mmobomb.com/api1/games?category="
        urlString = urlString.appending("\(cleanURL)")
        
        return URL(string: urlString)
    }
    //use json decoding to fetch books from api
    func fetchGames(from url: URL) {
        let gameTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let dataError = error {
                print("Error has occurred - \(dataError.localizedDescription)")
            } else {
                do {
                    guard let someData = data else {
                        return
                    }
                    
                    let jsonDecoder = JSONDecoder()
                    let downloadedResults = try jsonDecoder.decode([Game].self, from: someData)
                    self.games = downloadedResults
                    
                    DispatchQueue.main.async {
                        self.createDataSnapshot()
                    }
                } catch {
                    print("A decoding error has occurred - \(error.localizedDescription)")
                }
            }
        }
        gameTask.resume()
    }



}

