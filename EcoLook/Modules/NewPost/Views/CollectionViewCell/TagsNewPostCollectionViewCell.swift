//
//  TagsNewPostCollectionViewCell.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 29/06/22.
//

import UIKit

protocol ButtonNewPostViewCollectionCellDelegate: AnyObject{
    
    func btnAddDeleteTagNewPost(btnTagName: String?)
    
}

class TagsNewPostCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var buttonTagNewPost: UIButton!
    
    var tagNewPost: [Tag]?
    var delegate: ButtonNewPostViewCollectionCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = ThemeColors.verdeBackground
        
        
        buttonTagNewPost.tintColor = ThemeColors.verdeLabel
        buttonTagNewPost.backgroundColor = ThemeColors.verdeBackground
        buttonTagNewPost.layer.cornerRadius = 15
        
        
        tagNewPost = allTags.filter( {$0.id == buttonTagNewPost.tag} )
//        buttonTagNewPost.setTitle(tagNewPost?.name, for: .normal)
        
//        guard let id = tagNewPost?.id else{
//            return
//        }
//        buttonTagNewPost.tag = id
        
    }
    
    
    @IBAction func btnTagAction(_ sender: UIButton) {
        
        if sender.backgroundColor == ThemeColors.verdeBackground {
            
            sender.backgroundColor = ThemeColors.verdePrimary
            sender.tintColor = .white
            
        }else{
            
            sender.backgroundColor = ThemeColors.verdeBackground
            sender.tintColor = ThemeColors.verdeLabel
            
        }
        
        delegate?.btnAddDeleteTagNewPost(btnTagName: sender.currentTitle)
    }
    
}
