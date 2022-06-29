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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = ThemeColors.verdeBackground
        labelTitleHeader.textColor = ThemeColors.verdePrimary
        buttonGoBackHeader.tintColor = ThemeColors.verdePrimary
        
        imageViewPhotoNewPost.layer.cornerRadius = 15
        

        
    }
    @IBAction func actionButtonGoBackHeader(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    

}
