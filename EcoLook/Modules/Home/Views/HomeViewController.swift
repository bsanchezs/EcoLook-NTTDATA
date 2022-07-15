//
//  HomeViewController.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 23/06/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var buttonNewPost: UIButton!
    @IBOutlet weak var searchBarHome: UISearchBar!
    @IBOutlet weak var sliderTags: UICollectionView!
    @IBOutlet weak var tableViewPostsCards: UITableView!
    
    //    ----------------------------------------
    
    var presenter: HomePresenterProtocol? 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfigurationHomeViewController()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        presenter?.fetchAllPostsByUser(idUser: 1)
        
    }
    
    
    
    @IBAction func buttonGoNewPost(_ sender: Any) {
        
        presenter?.requestSendToNewPost()
        
        
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        guard let segueId = segue.identifier else {
//            return
//        }
//
//        if segueId == "homeToDetailSegue" || segueId == "favoritesToDetailSegue" || segueId == "personalToDetailSegue" {
//
//            let idPostToSend = sender as? Int
//
//            
//            let viewControllerDestination = segue.destination as! DetailViewController
//            viewControllerDestination.idSelectedPost = idPostToSend
//        }
//        //print("El segue del prepare es: \(segueId!)")
//
//
//
//    }
    


}

extension HomeViewController {
    
    func setConfigurationHomeViewController() {
        
        self.view.backgroundColor = ThemeColors.verdeBackground
        
        labelTitle.textColor = ThemeColors.verdePrimary
        
        buttonNewPost.tintColor = ThemeColors.verdePrimary
        
        searchBarHome.placeholder = "Buscar"
        searchBarHome.backgroundColor = ThemeColors.verdeBackground
        searchBarHome.barTintColor = ThemeColors.verdeInput
        searchBarHome.barStyle = .default
        searchBarHome.searchBarStyle = .minimal
        searchBarHome.delegate = self
        
        sliderTags.backgroundColor = ThemeColors.verdeBackground
        sliderTags.dataSource = self
        sliderTags.register(UINib(nibName: "TagsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "customCellTag")
        
        tableViewPostsCards.separatorStyle = .none
        tableViewPostsCards.showsVerticalScrollIndicator = false
        tableViewPostsCards.backgroundColor = ThemeColors.verdeBackground
        tableViewPostsCards.dataSource = self
        tableViewPostsCards.register(UINib(nibName: "PostsTableViewCell", bundle: nil), forCellReuseIdentifier: "customPostsCardsCell")
        
    }
    
}

extension HomeViewController: HomeViewProtocol {
    
    func showSuccessAllPostsByUser(allPosts: [Post]) {
        
        posts = allPosts
        allPostsByUser = allPosts
        
        tableViewPostsCards.reloadData()
        
    }
    
    func showSuccessImagePostByUrl(dataImage: Data, cell: PostsTableViewCell?) {
        
        DispatchQueue.main.async {
            cell?.imageViewCard.image = UIImage(data: dataImage)
        }
        
    }
    
    
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            
            guard let allPostsByUser = allPostsByUser else{
                return
            }
            
            posts = allPostsByUser
            tableViewPostsCards.reloadData()
            
        }else{
            
            let postsFiltro = posts.filter( {$0.titulo.contains(searchText) } )
            print("posts filtro: \(postsFiltro)")
            posts = postsFiltro
            tableViewPostsCards.reloadData()
            
        }
        
    }
    
}

extension HomeViewController: UICollectionViewDataSource{
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrEtiquetasTotales.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCellTag", for: indexPath) as? TagsCollectionViewCell
        
        cell?.btnTagHS.setTitle(arrEtiquetasTotales[indexPath.row].name, for: .normal)
        cell?.btnTagHS.tag = arrEtiquetasTotales[indexPath.row].id
        
        if ( !tagsNameSelectedToFilter.contains((cell?.btnTagHS.currentTitle)!) ){
            
            cell?.btnTagHS.backgroundColor = ThemeColors.verdeBackground
            
            cell?.btnTagHS.tintColor = ThemeColors.verdeLabel
            
        }else{
            
            cell?.btnTagHS.backgroundColor = ThemeColors.verdePrimary
            
            cell?.btnTagHS.tintColor = .white
            
        }
        
        cell?.delegate = self
        
        return cell!
        
    }
    
    
}


extension HomeViewController: ButtonViewCollectionCellDelegate{
    
    func btnHasPressed() {
        
        sliderTags.reloadData()
        
        if( tagsNameSelectedToFilter.isEmpty ) {
            
            if let allPostsByUser = allPostsByUser {
                
                posts = allPostsByUser
                
            }else{
                
                posts = []
                
            }
            
        }else {
            
            var postsFiltro: [Post] = []
            
            guard let allPostsByUser = allPostsByUser else{
                return
            }
            
            for post in allPostsByUser {
                
                if let tagsPost = post.etiquetas {
                    
                    var nameTagsPosts: [String] = []
                    
                    for tag in tagsPost {
                        
                        nameTagsPosts.append(tag.name)
                        
                    }
                    
                    var cumple = 1
                    
                    for tagFilter in tagsNameSelectedToFilter {
                        
                        if !nameTagsPosts.contains(tagFilter) {
                            
                            cumple = 0
                            break
                            
                        }
                        
                    }
                    
                    if cumple == 1 {
                        
                        postsFiltro.append(post)
                        
                    }
                    
                }
                
            }
            
            posts = postsFiltro
        
        }
        
        tableViewPostsCards.reloadData()
        
    }
    
}

extension HomeViewController: UITableViewDataSource{
    
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
        
        presenter?.fetchImagePostByUrl(url: url, cell: cell)
        
        cell?.labelTitleCard.text = posts[indexPath.row].titulo
        cell?.labelShortDescCard.text = posts[indexPath.row].getShortDescription(descripcion: posts[indexPath.row].descripcion)
        cell?.btnGoDetailCard.tag = posts[indexPath.row].idPublicacion
        cell?.selectionStyle = .none
        cell?.delegate = self
        
        return cell!
        
    }
    
    
}

extension HomeViewController: ButtonGoViewCellDelegate{
    
    
    func goToDetail(idPost: Int) {
        
        presenter?.requestSendToDetail(idPost: idPost)
        
        
        print("Esto lo manda para alla")
    }
    
    
    
}
