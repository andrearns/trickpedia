import UIKit

class TrickViewController: UIViewController {
    
    var trick: Trick!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var levelImageView: UIImageView!
    @IBOutlet var levelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelLabel.text = trick.level.rawValue
        nameLabel.text = trick.name
        descriptionLabel.text = trick.description
        
        switch trick.level {
        case .easy:
            levelImageView.image = UIImage(named: "easy")
        case .medium:
            levelImageView.image = UIImage(named: "medium")
        case .hard:
            levelImageView.image = UIImage(named: "hard")
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addVideo(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NewVideo")
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
}
