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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfigurationFavoriteViewController()

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

extension FavoritesViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customPostsCardsCell", for: indexPath) as? PostsTableViewCell
        
        print("imagen: \(posts[indexPath.row].imagen)")
        
        let url = posts[indexPath.row].getUrlImage(imagen: posts[indexPath.row].imagen)
        
//        presenter?.fetchImagePostByUrl(url: url, cell: cell)
        
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
        
//        presenter?.requestSendToDetail(idPost: idPost)

    }
    
    
    
}
