import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var categoryLabel: UILabel!
    
    var category: TrickCategory!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        categoryLabel.text = category.rawValue
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
        self.layer.borderColor = UIColor.white.cgColor
    }
}
