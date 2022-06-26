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
    
    
    @IBOutlet weak var inputSearch: UITextField!
    
    
    @IBOutlet weak var sliderTags: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = ThemeColors.verdeBackground
        
        labelTitle.textColor = ThemeColors.verdePrimary
        
        buttonNewPost.tintColor = ThemeColors.verdePrimary
        
        inputSearch.backgroundColor = ThemeColors.verdeInput
        
        inputSearch.borderStyle = .none
        
        sliderTags.dataSource = self
        
        
        
        // Do any additional setup after loading the view.
    }
    


}

extension UIViewController: UICollectionViewDataSource{
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrEtiquetasTotales.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("Que era el index path? \(indexPath)")
    }
    
    
    
    
    
}
