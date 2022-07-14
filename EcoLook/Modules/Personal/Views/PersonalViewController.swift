//
//  PersonalViewController.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 14/07/22.
//

import UIKit

class PersonalViewController: UIViewController {

    
    @IBOutlet weak var labelTitleHeaderPersonal: UILabel!
    @IBOutlet weak var buttonGoNewPost: UIButton!
    @IBOutlet weak var tableViewPersonalPostsCards: UITableView!
    
    var presenter: PersonalPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfigurationPersonalViewController()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        presenter?.fetchPersonalPostsByUser(idUser: 1)
        
    }
    
    @IBAction func actionButtonGoNewPost(_ sender: Any) {
        
        presenter?.requestSendToNewPost()
        
    }
}

extension PersonalViewController {
    
    func setConfigurationPersonalViewController() {
        
        self.view.backgroundColor = ThemeColors.verdeBackground
        
        labelTitleHeaderPersonal.textColor = ThemeColors.verdePrimary
        
        buttonGoNewPost.tintColor = ThemeColors.verdePrimary
        
        tableViewPersonalPostsCards.separatorStyle = .none
        tableViewPersonalPostsCards.showsVerticalScrollIndicator = false
        tableViewPersonalPostsCards.backgroundColor = ThemeColors.verdeBackground
        tableViewPersonalPostsCards.dataSource = self
        tableViewPersonalPostsCards.register(UINib(nibName: "PostsTableViewCell", bundle: nil), forCellReuseIdentifier: "customPostsCardsCell")
        
    }
    
    
}

extension PersonalViewController: PersonalViewProtocol {
    
    func showSuccessPersonalPostsByUser(personalPosts: [Post]) {
        
        posts = personalPosts
        tableViewPersonalPostsCards.reloadData()
        
    }
    
    func showSuccessImagePersonalPostByUrl(dataImage: Data, cell: PostsTableViewCell?) {
        
        DispatchQueue.main.async {
            cell?.imageViewCard.image = UIImage(data: dataImage)
        }
        
    }
    
    
    
}

extension PersonalViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customPostsCardsCell", for: indexPath) as? PostsTableViewCell
        
        let url = posts[indexPath.row].getUrlImage(imagen: posts[indexPath.row].imagen)
        
        presenter?.fetchImagePersonalPostByUrl(url: url, cell: cell)
        
        cell?.labelTitleCard.text = posts[indexPath.row].titulo
        cell?.labelShortDescCard.text = posts[indexPath.row].getShortDescription(descripcion: posts[indexPath.row].descripcion)
        cell?.btnGoDetailCard.tag = posts[indexPath.row].idPublicacion
        cell?.selectionStyle = .none
        cell?.delegate = self
        
        return cell!
        
    }
    
    
}

extension PersonalViewController: ButtonGoViewCellDelegate{
    
    
    func goToDetail(idPost: Int) {
        
        presenter?.requestSendToDetail(idPost: idPost)

    }
    
    
    
}
