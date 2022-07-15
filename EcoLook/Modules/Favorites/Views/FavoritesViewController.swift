//
//  FavoritesViewController.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 14/07/22.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var labelTitleHeaderFavorite: UILabel!
    @IBOutlet weak var buttonGoNewPost: UIButton!
    @IBOutlet weak var tableViewFavoritePostsCards: UITableView!
    
    var presenter: FavoritesPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfigurationFavoriteViewController()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        presenter?.fetchFavoritesPostsByUser(idUser: 1)
        
    }
    
    @IBAction func actionButtonGoNewPost(_ sender: Any) {
        
        presenter?.requestSendToNewPost()
        
    }
    
}

extension FavoritesViewController {
    
    func setConfigurationFavoriteViewController() {
        
        self.view.backgroundColor = ThemeColors.verdeBackground
        
        labelTitleHeaderFavorite.textColor = ThemeColors.verdePrimary
        
        buttonGoNewPost.tintColor = ThemeColors.verdePrimary
        
        tableViewFavoritePostsCards.separatorStyle = .none
        tableViewFavoritePostsCards.showsVerticalScrollIndicator = false
        tableViewFavoritePostsCards.backgroundColor = ThemeColors.verdeBackground
        tableViewFavoritePostsCards.dataSource = self
        tableViewFavoritePostsCards.register(UINib(nibName: "PostsTableViewCell", bundle: nil), forCellReuseIdentifier: "customPostsCardsCell")
        
    }
    
}

extension FavoritesViewController: FavoritesViewProtocol {
    
    func showSuccessFavoritesPostsByUser(favoritesPosts: [Post]) {
        
        posts = favoritesPosts
        tableViewFavoritePostsCards.reloadData()
        
    }
    
    func showSuccessImageFavoritePostByUrl(dataImage: Data, cell: PostsTableViewCell?) {
        
        DispatchQueue.main.async {
            cell?.imageViewCard.image = UIImage(data: dataImage)
        }
        
    }
    
    
    
}

extension FavoritesViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customPostsCardsCell", for: indexPath) as? PostsTableViewCell
        
        let url = posts[indexPath.row].getUrlImage(imagen: posts[indexPath.row].imagen)
        
        presenter?.fetchImageFavoritePostByUrl(url: url, cell: cell)
        
        cell?.labelTitleCard.text = posts[indexPath.row].titulo
        cell?.labelShortDescCard.text = posts[indexPath.row].getShortDescription(descripcion: posts[indexPath.row].descripcion)
        cell?.btnGoDetailCard.tag = posts[indexPath.row].idPublicacion
        cell?.selectionStyle = .none
        cell?.delegate = self
        
        return cell!
        
    }
    
    
}

extension FavoritesViewController: ButtonGoViewCellDelegate{
    
    
    func goToDetail(idPost: Int) {
        
        presenter?.requestSendToDetail(idPost: idPost)

    }
    
}


//extension FavoritesViewController: ButtonFavoriteDelegate{
//
//    func buttonFavoriteHasPressed() {
//
//        print("Llega aqui??")
//
//        tableViewFavoritePostsCards.reloadData()
//
//    }
//
//}
