//
//  TagsPostDetailCollectionViewCell.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 28/06/22.
//

import UIKit

class TagsPostDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelTagPostDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.backgroundColor = ThemeColors.verdePrimary
        
    }

}
