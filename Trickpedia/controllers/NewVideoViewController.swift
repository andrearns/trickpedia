import UIKit

class NewVideoViewController: UIViewController {
    
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var addVideoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 25
        addVideoButton.layer.cornerRadius = 15
    }
    
    @IBAction func saveVideo(_ sender: Any) {
        print("Save video")
        self.dismiss(animated: true, completion: nil)
    }
    
}
