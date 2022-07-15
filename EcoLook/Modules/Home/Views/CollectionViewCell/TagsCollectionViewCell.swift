//
//  TagsCollectionViewCell.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 26/06/22.
//

import UIKit

protocol ButtonViewCollectionCellDelegate: AnyObject {
    
    func btnHasPressed()
    
}

class TagsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var btnTagHS: UIButton!
    
    weak var delegate: ButtonViewCollectionCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

        viewCell.backgroundColor = ThemeColors.verdeBackground
        
        // Tener efecto de redondeado
        btnTagHS.layer.cornerRadius = 10
        btnTagHS.clipsToBounds = true
        
    }

    @IBAction func btnAction() {
                
        if ( !setTagsNameSelected.contains(btnTagHS.currentTitle!) ){
            
            setTagsNameSelected.insert(btnTagHS.currentTitle!)
            
        }else{
            
            setTagsNameSelected.remove(btnTagHS.currentTitle!)
            
        }
 
        delegate?.btnHasPressed()
        
    }
    
}
