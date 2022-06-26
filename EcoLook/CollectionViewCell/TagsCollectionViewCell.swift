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
        
//        self.backgroundColor = ThemeColors.verdeBackground
//        self.backgroundColor = .white
        
        viewCell.backgroundColor = ThemeColors.verdeBackground
        
        btnTagHS.tintColor = ThemeColors.verdeLabel
        
//        btnTagHS.backgroundColor = ThemeColors.verdeLabel
        
        
        
    }

    @IBAction func btnAction(_ sender: UIButton) {
        
        delegate?.btnHasPressed(btnPressed: btnTagHS)
        
    }
    
}
