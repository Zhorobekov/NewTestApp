import UIKit
import Kingfisher

final class MainViewController: UIViewController {
    
    @IBOutlet weak var imagesTableView: UITableView!
    
    var images: [ImageItem] = []
    
    private var networkingManager = NetworkingManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkingManager.delegate = self
        networkingManager.fetchImages()
     
    }
}

//MARK: - Delegate, DataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
    }
}

//MARK: - NeteorkingManager

extension MainViewController: NetworkingManagerDelegate {
    func onUpdateImageModel(width model: ImageModel) {
        images = model.photos
        imagesTableView.reloadData()
    }
}

