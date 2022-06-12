import UIKit
import Kingfisher

final class MainViewController: UIViewController {
    
    @IBOutlet weak var imagesTableView: UITableView!
    
    var images: [ImageItem] = []
    
    private var networkingManager = NetworkingManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkingManager.fetchImages()
    }
}

//MARK: - Delegate, DataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        let imageData = images[indexPath.row]
        
        content.text = imageData.photographer
        content.secondaryText = imageData.alt
        let imageView = UIImageView()
        let url = URL(string: imageData.src.medium)
        imageView.kf.setImage(with: url)
        content.image = imageView.image
        
        cell.contentConfiguration = content
        return cell
    }
}

//MARK: - NeteorkingManager

extension MainViewController: NetworkingManagerDelegate {
    func onUpdateImageModel(width model: ImageModel) {
        print("Images")
    }
}

