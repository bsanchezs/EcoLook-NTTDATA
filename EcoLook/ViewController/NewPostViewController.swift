//
//  NewPostViewController.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 28/06/22.
//

import UIKit

class NewPostViewController: UIViewController {

    @IBOutlet weak var labelTitleHeader: UILabel!
    @IBOutlet weak var buttonGoBackHeader: UIButton!
    @IBOutlet weak var imageViewPhotoNewPost: UIImageView!
    @IBOutlet weak var buttonAddPhotoNewPost: UIButton!
    @IBOutlet weak var inputTitleNewPost: UITextField!
    @IBOutlet weak var inputDirectionNewPost: UITextField!
    @IBOutlet weak var buttonDirectionNewPost: UIButton!
    @IBOutlet weak var textViewDescriptionNewPost: UITextView!
    @IBOutlet weak var sliderRiskLevelNewPost: UISlider!
    @IBOutlet weak var collectionViewTagsNewPost: UICollectionView!
    @IBOutlet weak var buttonSaveNewPost: UIButton!
    
    
    var newPost = Post()
    var setTagsSelectedNewPost = Set<String>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = ThemeColors.verdeBackground
        
        labelTitleHeader.textColor = ThemeColors.verdePrimary
        buttonGoBackHeader.tintColor = ThemeColors.verdePrimary
        
        imageViewPhotoNewPost.layer.cornerRadius = 15
        
        buttonDirectionNewPost.tintColor = ThemeColors.verdePrimary
        
        textViewDescriptionNewPost.backgroundColor = .white
        textViewDescriptionNewPost.layer.borderWidth = 1
        textViewDescriptionNewPost.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.08)
        textViewDescriptionNewPost.layer.cornerRadius = 15
        
        sliderRiskLevelNewPost.thumbTintColor = ThemeColors.verdePrimary
        sliderRiskLevelNewPost.tintColor = ThemeColors.verdePrimary
        
        collectionViewTagsNewPost.showsVerticalScrollIndicator = false
        collectionViewTagsNewPost.backgroundColor = ThemeColors.verdeBackground
        collectionViewTagsNewPost.dataSource = self
        
        buttonSaveNewPost.backgroundColor = ThemeColors.verdePrimary
        buttonSaveNewPost.tintColor = .white
        buttonSaveNewPost.layer.cornerRadius = 15
        
        
        
        
    }
    @IBAction func actionButtonGoBackHeader(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    

}

extension NewPostViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrEtiquetasTotales.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCellTagNewPost", for: indexPath) as? TagsNewPostCollectionViewCell
        
        cell?.buttonTagNewPost.setTitle(arrEtiquetasTotales[indexPath.row].name, for: .normal)
        
        cell?.buttonTagNewPost.tag = arrEtiquetasTotales[indexPath.row].id
        
        cell?.delegate = self
        
        return cell!
        
        
    }
    
    
    
}

extension NewPostViewController: ButtonNewPostViewCollectionCellDelegate{
    
    func btnAddDeleteTagNewPost(btnTagName: String?) {
        
        guard let tagName = btnTagName else{
            return
        }
        
        if setTagsSelectedNewPost.contains(tagName) {
            
            setTagsSelectedNewPost.remove(tagName)
            
        }else{
        
            setTagsSelectedNewPost.insert(tagName)
            
        }
        
        
//        setTagsSelectedNewPost.contains(tagName) == true ? setTagsSelectedNewPost.insert(tagName) : setTagsSelectedNewPost.remove(tagName)
        
        
        print(setTagsSelectedNewPost)
        
    }
    
    
}
