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
//    ----------------------------------------
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = ThemeColors.verdeBackground
        
        labelTitle.textColor = ThemeColors.verdePrimary
        
        buttonNewPost.tintColor = ThemeColors.verdePrimary
        
        inputSearch.backgroundColor = ThemeColors.verdeInput
        
        inputSearch.borderStyle = .none
        
        sliderTags.backgroundColor = ThemeColors.verdeBackground
        
        sliderTags.dataSource = self
        sliderTags.register(UINib(nibName: "TagsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "customCellTag")
        
        
        
        
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCellTag", for: indexPath) as? TagsCollectionViewCell
        
        cell?.btnTagHS.setTitle(arrEtiquetasTotales[indexPath.row].name, for: .normal)
        cell?.btnTagHS.tag = arrEtiquetasTotales[indexPath.row].id
        
        cell?.delegate = self
        
        return cell!
        
    }
    
    
    
    
    
}


extension UIViewController: ButtonViewCollectionCellDelegate{
    
    
    func btnHasPressed(btnPressed: UIButton) {
        
        
        
        let tagButtonPressed = btnPressed.tag
        
        guard let nameButtonPressed = btnPressed.currentTitle else {
            return
        }
        
        
//        print("El tag es: \(tagButtonPressed) y el nombre es: \(nameButtonPressed)")
        
        if setTagsNameSelected.contains(nameButtonPressed){
            
            setTagsNameSelected.remove(nameButtonPressed)
            
            btnPressed.tintColor = ThemeColors.verdeLabel
            
            btnPressed.backgroundColor = ThemeColors.verdeBackground
            
        } else {
            
            setTagsNameSelected.insert(nameButtonPressed)
            
            btnPressed.tintColor = .white
            
            btnPressed.backgroundColor = ThemeColors.verdePrimary
            
        }
        
        
        
        
    }
    
}
