//
//  TagsCollectionViewCell.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 26/06/22.
//

import UIKit

protocol ButtonViewCollectionCellDelegate: AnyObject {
    
    func btnHasPressed(btnPressed: UIButton)
    
}

class TagsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var btnTagHS: UIButton!
    
    weak var delegate: ButtonViewCollectionCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

        // Color de cada celda
        viewCell.backgroundColor = ThemeColors.verdeBackground
        
        //Color de las etiquetas
        btnTagHS.tintColor = ThemeColors.verdeLabel
        
        // Tener efecto de redondeado
        btnTagHS.layer.cornerRadius = 10
        btnTagHS.clipsToBounds = true
        
        
//        btnTagHS.backgroundColor = ThemeColors.verdeLabel
        
        
        
    }

    @IBAction func btnAction(_ sender: UIButton) {
        
        delegate?.btnHasPressed(btnPressed: btnTagHS)
        
    }
    
}
