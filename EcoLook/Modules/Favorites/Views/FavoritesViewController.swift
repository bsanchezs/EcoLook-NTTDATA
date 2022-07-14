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
//        tableViewFavoritePostsCards.dataSource = self
        tableViewFavoritePostsCards.register(UINib(nibName: "PostsTableViewCell", bundle: nil), forCellReuseIdentifier: "customPostsCardsCell")
        
    }
    
}
