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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = ThemeColors.verdeClaro
        
        labelTitle.textColor = ThemeColors.verdeOscuro
        
        buttonNewPost.tintColor = ThemeColors.verdeOscuro
        
//        self.tabBarItem = UITabBarItem(title: "AEa", image: nil, tag: 1)
        
        
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
