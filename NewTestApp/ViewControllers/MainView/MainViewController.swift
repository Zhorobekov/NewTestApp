import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet weak var imagesTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var networkingManager = NetworkingManager()
    private var viewModel: MainViewModelProtocol!
    private var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
        viewModel = MainViewModel()
        activityIndicator = showSpinner(in: view)
        searchBar.delegate = self
    }
        
    private func registerCustomCell() {
        let nib = UINib(nibName: "CustomCell", bundle: Bundle(for: CustomCell.self))
        imagesTableView.register(nib, forCellReuseIdentifier: "CustomCell")
    }
    
//MARK: - ActivityIndicator
    private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .darkGray
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }
    
//MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else {return}
        detailVC.viewModel = sender as? DetailViewModelProtocol
    }
}

//MARK: - Delegate, DataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailViewModel = viewModel.detailViewModel(at: indexPath)
        performSegue(withIdentifier: "showDetail", sender: detailViewModel)
    }
}

//MARK: - SearchBar Delegate
extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        activityIndicator.startAnimating()
        viewModel.getImages(with: searchBar.text!) {
            self.imagesTableView.reloadData()
            self.activityIndicator.stopAnimating()
        }
        view.endEditing(true)
    }
}

