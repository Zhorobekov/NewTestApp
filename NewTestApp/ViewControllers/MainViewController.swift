import UIKit
import Kingfisher

class MainViewController: UIViewController {
    
    @IBOutlet weak var imagesTableView: UITableView!
    
    var images: [ImageItem] = []
    
    private var networkingManager = NetworkingManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkingManager.delegate = self
        networkingManager.fetchImages()
     
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
    }
    
    
}
extension MainViewController: NetworkingManagerDelegate {
    func onUpdateImageModel(width model: ImageModel) {
        images = model.photos
        imagesTableView.reloadData()
    }
}

