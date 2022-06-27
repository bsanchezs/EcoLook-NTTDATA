//
//  DetailViewController.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 27/06/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var idSelectedPost: Int?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let post = getPostSelected(idPost: idSelectedPost)
        
        
        
        
        print("recibio el post? : \(post)")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

func getPostSelected(idPost: Int?) -> Post{
    
    guard let idPostSafe = idPost else{
        return Post()
    }
    
    let post = arrMockPosts.filter( {$0.idPublicacion == idPostSafe} )
    
    return post[0]
    
}
