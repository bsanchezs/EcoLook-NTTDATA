//
//  DetailViewController.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 27/06/22.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageViewDetail: UIImageView!
    @IBOutlet weak var scrollDetailView: UIScrollView!
    @IBOutlet weak var viewDetail: UIView!
    @IBOutlet weak var labelTitlePostDetail: UILabel!
    @IBOutlet weak var labelDatePostDetail: UILabel!
    @IBOutlet weak var buttonFavoritePostDetail: UIButton!
    @IBOutlet weak var labelDescriptionPostDetail: UILabel!
    @IBOutlet weak var webViewPostDetail: WKWebView!
    @IBOutlet weak var labelDirectionPostDetail: UILabel!
    @IBOutlet weak var imageViewRiskLevel: UIImageView!
    
    
    var idSelectedPost: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let post = getPostSelected(idPost: idSelectedPost)
        
        print("recibio el post? : \(post)")
        
        imageViewDetail.image = UIImage(named: "Contaminacion")
        imageViewDetail.contentMode = .scaleAspectFill
        
        
        // Redondear el scrollView y el view
        scrollDetailView.clipsToBounds = true
        scrollDetailView.layer.cornerRadius = 25
        scrollDetailView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        viewDetail.clipsToBounds = true
        viewDetail.layer.cornerRadius = 25
        viewDetail.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        
        
        
        
        
        
    }
    

}

func getPostSelected(idPost: Int?) -> Post{
    
    guard let idPostSafe = idPost else{
        return Post()
    }
    
    let post = arrMockPosts.filter( {$0.idPublicacion == idPostSafe} )
    
    return post[0]
    
}

extension DetailViewController: UICollectionViewDataSource{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
}
