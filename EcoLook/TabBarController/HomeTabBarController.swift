//
//  HomeTabBarController.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 24/06/22.
//

import UIKit

class HomeTabBarController: UITabBarController {

    @IBOutlet weak var tabBarHome: UITabBar!
    private var count = 0
    var tabBarItemHome: UITabBarItem?
//    let tabBarAppareance = UITabBarAppearance()
//
//    tabBarAppareance.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarHome.backgroundColor = ThemeColors.verdePrimary
//        tabBarHome.tintColor = UIColor.white
        
        
        for item in arrayTabBarOptions {
            
            switch item {
                
            case .Home:
                tabBarItemHome = tabBarHome.items?[0]
                tabBarItemHome?.title = "Home"
                tabBarItemHome?.image = UIImage(systemName: "homekit")
                
            case .Favoritos:
                tabBarItemHome = tabBarHome.items?[1]
                tabBarItemHome?.title = "Favoritos"
                tabBarItemHome?.image = UIImage(systemName: "star.circle.fill")
                
            case .Personal:
                tabBarItemHome = tabBarHome.items?[2]
                tabBarItemHome?.title = "Personal"
                tabBarItemHome?.image = UIImage(systemName: "newspaper")
                
            }
            tabBarHome.unselectedItemTintColor = UIColor.white
            count += 1
            
        }
        
//        tabBar.items[0].title =  TabBarOptions

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
