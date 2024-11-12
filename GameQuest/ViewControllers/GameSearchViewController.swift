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
        tableView, indexPath, game in
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as! GameTableViewCell
        
        cell.gameTitle.text = game.title
        cell.gamePublisher.text = game.publisher
        cell.gameDate.text = String(game.release_date?.prefix(4) ?? "")
        self.fetchImages(forGame: game.thumbnail ?? "", forCell: cell)
        
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
    //function to fetch images from api and applying them to reusable cell
    func fetchImages(forGame game: String, forCell cell: GameTableViewCell){
        guard let imageUrl =  URL(string: game) else {
            print("Can't make a url from \(game)")
            return
        }
        
        let imageFetchTask = URLSession.shared.downloadTask(with: imageUrl){
            url, response, error in
            
            if error == nil, let url = url, let data = try? Data(contentsOf: url), let image = UIImage(data: data){
                
                DispatchQueue.main.async {
                    cell.gameImage.image = image
                }
            }
            
        }
        imageFetchTask.resume()
    }
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        let game = games[selectedIndexPath.row]
        let destination = segue.destination as! DetailsViewController
        destination.game = game
        
        guard let cell = tableView.cellForRow(at: selectedIndexPath) as? GameTableViewCell else {return}
        let image = cell.gameImage.image
        destination.passedImage = image

        
    }
    
    //MARK: Actions
    
    //each button changes the url to specific keyword and updates table
    @IBAction func shooterButton(_ sender: Any) {
        if let bookURL = createGameURL(from: "shooter"){
            fetchGames(from: bookURL)
        }
    }
    @IBAction func strategyButton(_ sender: Any) {
        if let bookURL = createGameURL(from: "strategy"){
            fetchGames(from: bookURL)
        }
    }
    @IBAction func racingButton(_ sender: Any) {
        if let bookURL = createGameURL(from: "racing"){
            fetchGames(from: bookURL)
        }
    }

    @IBAction func horrorButton(_ sender: Any) {
        if let bookURL = createGameURL(from: "horror"){
            fetchGames(from: bookURL)
        }
    }
    @IBAction func actionButton(_ sender: Any) {
        if let bookURL = createGameURL(from: "action"){
            fetchGames(from: bookURL)
        }
    }
    


}

