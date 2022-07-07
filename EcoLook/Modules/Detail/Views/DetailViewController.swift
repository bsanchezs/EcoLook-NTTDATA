//
//  DetailViewController.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 27/06/22.
//

import UIKit
import GoogleMaps

class DetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageViewDetail: UIImageView!
    @IBOutlet weak var scrollDetailView: UIScrollView!
    @IBOutlet weak var viewDetail: UIView!
    @IBOutlet weak var labelTitlePostDetail: UILabel!
    @IBOutlet weak var labelDatePostDetail: UILabel!
    @IBOutlet weak var buttonFavoritePostDetail: UIButton!
    @IBOutlet weak var labelDescriptionPostDetail: UILabel!
    @IBOutlet weak var viewMapPostDetail: GMSMapView!
    @IBOutlet weak var labelDirectionPostDetail: UILabel!
    @IBOutlet weak var imageViewRiskLevel: UIImageView!
    @IBOutlet weak var collectionViewTagsPostDetail: UICollectionView!
    
    
    var idSelectedPost: Int?
    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfigurationDetailViewController()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setMapByLatLng(lat: post?.latitud, lng: post?.latitud)
    }
    

}

extension DetailViewController {
    
    func setConfigurationDetailViewController() {
        
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
        
//        setMapByLatLng(lat: post?.latitud, lng: post?.latitud)
        labelDirectionPostDetail.text = post?.direccion
        
        
        let icon = getNameIconByRiskLevel(riskLevel: post?.nivelRiesgo)
        imageViewRiskLevel.image = UIImage(systemName: icon)
        
        collectionViewTagsPostDetail.dataSource = self
        
    }
    
    func getPostSelected(idPost: Int?) -> Post{
        
        guard let idPostSafe = idPost else{
            return Post()
        }
        
        let post = arrMockPosts.filter( {$0.idPublicacion == idPostSafe} )
        
        return post[0]
        
    }

    func setMapByLatLng(lat: Double?, lng: Double?) {
        
        
        if let latSafe = lat, let lngSafe = lng {
            
            let camera = GMSCameraPosition(latitude: latSafe, longitude: lngSafe, zoom: 17.4)
            viewMapPostDetail.camera = camera
            
            
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: latSafe, longitude: lngSafe)
            marker.map = viewMapPostDetail
            marker.isDraggable = false
            
        }else{
            
            let camera = GMSCameraPosition(latitude: -8.1121075, longitude: -79.028297, zoom: 14.4)
            viewMapPostDetail.camera = camera
            viewMapPostDetail.settings.rotateGestures = false
            viewMapPostDetail.settings.scrollGestures = false
            viewMapPostDetail.settings.tiltGestures = false
            viewMapPostDetail.settings.zoomGestures = false
            viewMapPostDetail.settings.consumesGesturesInView = false
            
            
        }
        
        
    }


    func getNameIconByRiskLevel(riskLevel: Int?) -> String {
        
        guard let risklvl = riskLevel else{
            return "0.square.fill"
        }
        
        return String(risklvl)+".square.fill"
    }

    
    
    
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