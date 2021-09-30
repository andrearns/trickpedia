import UIKit

class TrickTableViewCell: UITableViewCell {
    
    @IBOutlet var trickLabel: UILabel!
    @IBOutlet var cellBackgroundView: UIView!
    @IBOutlet var categoryBackgroundView: UIView!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var levelImageView: UIImageView!
    @IBOutlet var levelLabel: UILabel!
    
    var trick: Trick!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellBackgroundView.layer.cornerRadius = 15
        categoryBackgroundView.layer.cornerRadius = 5
    }
    
    func setup() {
        trickLabel.text = self.trick.name
        categoryLabel.text = self.trick.category.rawValue
        levelLabel.text = self.trick.level.rawValue
        
        switch trick.level {
        case .easy :
            levelImageView.image = UIImage(named: "easy")
        case .medium:
            levelImageView.image = UIImage(named: "medium")
        case .hard:
            levelImageView.image = UIImage(named: "hard")
        }
    }
}
