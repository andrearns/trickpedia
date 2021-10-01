import UIKit

class RequiredTrickTableViewCell: UITableViewCell {

    @IBOutlet var trickLabel: UILabel!
    @IBOutlet var bulletView: UIView!
    
    var trick: Trick!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bulletView.layer.cornerRadius = 4
    }
    
    func setup(trick: Trick) {
        self.trick = trick
        switch self.trick.currentState {
        case .done:
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self.trick.name)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 3, range: NSMakeRange(0, attributeString.length))
            attributeString.addAttribute(NSAttributedString.Key.strikethroughColor, value: UIColor(named: "Green")!, range: NSMakeRange(0, attributeString.length))
            trickLabel.attributedText = attributeString
        default:
            trickLabel.text = self.trick.name
        }
    }

}
