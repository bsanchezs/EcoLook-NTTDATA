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
    @IBOutlet weak var collectionViewTagsPostDetail: UICollectionView!
    
    
    var idSelectedPost: Int?
    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        post = getPostSelected(idPost: idSelectedPost)
        
//        print("recibio el post? : \(post)")
        
        imageViewDetail.image = UIImage(named: "Contaminacion")
        imageViewDetail.contentMode = .scaleAspectFill
        
        
        // Redondear el scrollView y el view
        scrollDetailView.clipsToBounds = true
        scrollDetailView.layer.cornerRadius = 25
        scrollDetailView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        viewDetail.clipsToBounds = true
        viewDetail.layer.cornerRadius = 25
        viewDetail.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        // --------------
        
        labelTitlePostDetail.text = post?.titulo
        labelDatePostDetail.text = post?.fecha
        labelDescriptionPostDetail.text = post?.descripcion
        labelDirectionPostDetail.text = post?.direccion
        
        let googleMapsEmbed = getUrlGoogleMapsByLatLng(lat: post?.latitud, lng: post?.longitud)
        webViewPostDetail.load(URLRequest(url: URL(string: googleMapsEmbed)!))
        
        let icon = getNameIconByRiskLevel(riskLevel: post?.nivelRiesgo)
        imageViewRiskLevel.image = UIImage(systemName: icon)
        
        collectionViewTagsPostDetail.dataSource = self
        
        
        
        
        
        
    }
    

}

func getPostSelected(idPost: Int?) -> Post{
    
    guard let idPostSafe = idPost else{
        return Post()
    }
    
    let post = arrMockPosts.filter( {$0.idPublicacion == idPostSafe} )
    
    return post[0]
    
}

func getUrlGoogleMapsByLatLng(lat: Double?, lng: Double?) -> String {
    
    
    if let latSafe = lat, let lngSafe = lng {
        
        return "https://www.google.com/maps/@"+String(latSafe)+","+String(lngSafe)+",18.6z"
        
    }else{
        return "https://www.google.com/maps/@-8.1114925,-79.0287559,18.6z"
    }
    
    
    
    
}


func getNameIconByRiskLevel(riskLevel: Int?) -> String {
    
    guard let risklvl = riskLevel else{
        return "0.square.fill"
    }
    
    return String(risklvl)+".square.fill"
}

extension DetailViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return post?.arrayEtiquetas?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCellTagDetail", for: indexPath) as? TagsPostDetailCollectionViewCell
        
        
        cell?.labelTagPostDetail.text = post?.arrayEtiquetas?[indexPath.row].name
        
        
        guard let cellDesempaquetado = cell else{
            return UICollectionViewCell()
        }
        
        return cellDesempaquetado
        
        
    }
    
}
