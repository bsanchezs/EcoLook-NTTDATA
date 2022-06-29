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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = ThemeColors.verdeBackground
        labelTitleHeader.tintColor = ThemeColors.verdePrimary
        buttonGoBackHeader.tintColor = ThemeColors.verdePrimary
        

        
    }
    @IBAction func actionButtonGoBackHeader(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    

}
