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
        let nib = UINib(nibName: "CustomCell", bundle: Bundle(for: CustomCell.self))
        imagesTableView.register(nib, forCellReuseIdentifier: "CustomCell")
     
    }
}

//MARK: - Delegate, DataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        let imageData = images[indexPath.row]
        
        cell.imageCell.image = UIImage(data: ImageManager.shared.fetchImage(from: imageData.src.medium)!)
        cell.imageCell.layer.cornerRadius = cell.imageCell.bounds.width / 2
        cell.nameCell.text = imageData.alt 
        cell.descriptionCell.text = imageData.photographer
        
        return cell
    }
}

//MARK: - NeteorkingManager

extension MainViewController: NetworkingManagerDelegate {
    func onUpdateImageModel(width model: ImageModel) {
        images = model.photos
        imagesTableView.reloadData()
    }
}

