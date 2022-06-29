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
        

        
    }
    @IBAction func actionButtonGoBackHeader(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    

}
