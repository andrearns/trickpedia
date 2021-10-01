import UIKit

class TrickViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var trick: Trick!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var levelImageView: UIImageView!
    @IBOutlet var levelLabel: UILabel!
    @IBOutlet var addVideoButton: UIButton!
    @IBOutlet var requiredTricksTableView: UITableView!
    @IBOutlet var requirementsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(trick)
        
        requiredTricksTableView.delegate = self
        requiredTricksTableView.dataSource = self
        
        levelLabel.text = trick.level.rawValue
        nameLabel.text = trick.name
        descriptionLabel.text = trick.description
        addVideoButton.layer.cornerRadius = 25
        
        switch trick.level {
        case .easy:
            levelImageView.image = UIImage(named: "easy")
        case .medium:
            levelImageView.image = UIImage(named: "medium")
        case .hard:
            levelImageView.image = UIImage(named: "hard")
        }
        
        switch trick.currentState {
        case .locked:
            addVideoButton.setImage(UIImage(systemName: "lock.fill"), for: .normal)
            addVideoButton.setTitle("   Trick bloqueada", for: .normal)
            addVideoButton.tintColor = .white
            addVideoButton.layer.backgroundColor = UIColor.gray.cgColor
            addVideoButton.tag = 0
        default:
            print("")
            addVideoButton.tag = 1
        }
        
        requirementsLabel.text = "Requisitos: \(calculateRequiredTricksDone())/\(trick.requiredTricksIDs.count)"
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func calculateRequiredTricksDone() -> Int {
        var requiredTricksDone = 0
        
        for i in 0..<trick.requiredTricksIDs.count {
            if TricksManager.shared.fetchTrickUsingID(id: trick.requiredTricksIDs[i])?.currentState == .done {
                requiredTricksDone += 1
            }
        }
        return requiredTricksDone
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trick.requiredTricksIDs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = requiredTricksTableView.dequeueReusableCell(withIdentifier: "requiredTrickCell") as! RequiredTrickTableViewCell
        let trick = TricksManager.shared.fetchTrickUsingID(id: trick.requiredTricksIDs[indexPath.row])
        cell.setup(trick: trick!)
        return cell
    }

    
    @IBAction func addVideo(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if sender.tag == 1 {
            let vc = storyboard.instantiateViewController(withIdentifier: "NewVideo")
            navigationController?.present(vc, animated: true, completion: nil)
        } else {
            let vc = storyboard.instantiateViewController(withIdentifier: "LockedTrickPopUp") as? LockedTrickPopUpViewController
            vc?.trick = trick
            navigationController?.present(vc!, animated: true, completion: nil)
        }
    }
    
}
