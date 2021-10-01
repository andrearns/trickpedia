import UIKit

var categoriesList: [TrickCategory] = [
    .all,
    .flatground,
    .rail,
    .vertical,
    .grab
]

class TrickListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UISearchResultsUpdating {

    @IBOutlet var tricksSearchBar: UISearchBar!
    @IBOutlet var tricksTableView: UITableView!
    @IBOutlet var categoriesCollectionView: UICollectionView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredTrickList: [Trick] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tricksTableView.delegate = self
        tricksTableView.dataSource = self
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Procure por uma trick"
        searchController.searchBar.setValue("Cancelar", forKey: "cancelButtonText")
        searchController.searchBar.barTintColor = UIColor(named: "Green")
        
        TricksManager.shared.checkIfTricksAreLocked()
        filteredTrickList = TricksBank.shared.trickList
        
        title = "Trickpedia"
        navigationItem.searchController = searchController
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoriesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCollectionViewCell
        let category = categoriesList[indexPath.row]
        cell?.category = category
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = categoriesCollectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
            cell.layer.borderColor = UIColor(named: "Green")?.cgColor
            cell.categoryLabel.textColor = UIColor(named: "Green")
            cell.categoryLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
        }
        
        let category = categoriesList[indexPath.row]
        if category != .all {
            filteredTrickList = TricksBank.shared.trickList.filter({ trick in
                trick.category == category
            })
        } else {
            filteredTrickList = TricksBank.shared.trickList
        }
        tricksTableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = categoriesCollectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
            cell.layer.borderColor = UIColor.white.cgColor
            cell.categoryLabel.textColor = UIColor.white
            cell.categoryLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
            
        }
        filteredTrickList = TricksBank.shared.trickList
        tricksTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTrickList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tricksTableView.dequeueReusableCell(withIdentifier: "trickCell") as! TrickTableViewCell
        let trick = filteredTrickList[indexPath.row]
        cell.trick = trick
        cell.setup()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Trick") as? TrickViewController
        let trick = filteredTrickList[indexPath.row]
        vc?.trick = trick
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        if text == "" {
            filteredTrickList = TricksBank.shared.trickList
        } else {
            filteredTrickList = filteredTrickList.filter({ trick in
                return trick.name.starts(with: text) || trick.name.contains(text) || trick.category.rawValue.starts(with: text) || trick.level.rawValue.starts(with: text)
            })
        }
        
        tricksTableView.reloadData()
        
        print(text)
    }
}
