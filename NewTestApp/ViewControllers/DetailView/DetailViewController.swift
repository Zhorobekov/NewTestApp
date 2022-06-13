//
//  DetailViewController.swift
//  NewTestApp
//
//  Created by Azamat on 12.06.2022.
//

import UIKit
import Kingfisher
import RealmSwift

class DetailViewController: UIViewController {
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailDescription: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    var viewModel: DetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    @IBAction func didTap(_ sender: UIButton) {
        animateButton(sender: likeButton)
        if !viewModel.isFavorite {
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            viewModel.saveImage()
        } else {
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
            viewModel.deleteImage()
        }
    }
    
    func setupUI() {
        guard let url = URL(string: viewModel.imageURL) else { return }
        detailImage.kf.setImage(with: url)
        detailDescription.text = viewModel.imageDescription
        setStatusForLikeButton(viewModel.isFavorite)
    }
    
    private func setStatusForLikeButton(_ status: Bool) {
        let buttonImage = viewModel.isFavorite
        ? UIImage(systemName: "heart.fill")
        : UIImage(systemName: "heart")
        likeButton.setImage(buttonImage, for: .normal)
    }
    
    private func animateButton(sender: UIButton) {
        
        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(6.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: { sender.transform = CGAffineTransform.identity }
        )
    }
}
