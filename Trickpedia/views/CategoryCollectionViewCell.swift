import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var categoryLabel: UILabel!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
        self.layer.borderColor = UIColor.white.cgColor
    }
    
    func setup(category: TrickCategory) {
        categoryLabel.text = category.rawValue
    }
}
