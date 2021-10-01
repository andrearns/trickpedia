import UIKit

class LockedTrickPopUpViewController: UIViewController {

    @IBOutlet var popUpBackgroundView: UIView!
    @IBOutlet var continueButton: UIButton!
    
    var trick: Trick!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpBackgroundView.layer.cornerRadius = 15
        continueButton.layer.cornerRadius = 25
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
