//
//  PostsTableViewCell.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 26/06/22.
//

import UIKit


protocol ButtonGoViewCellDelegate: AnyObject{
    
    func goToDetail(btnGo: UIButton)
    
}

class PostsTableViewCell: UITableViewCell {
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var imageViewCard: UIImageView!
    @IBOutlet weak var labelTitleCard: UILabel!
    @IBOutlet weak var btnGoDetailCard: UIButton!
    @IBOutlet weak var labelShortDescCard: UILabel!
    
    weak var delegate: ButtonGoViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = ThemeColors.verdeBackground
        
        viewCard.layer.cornerRadius = 15
        viewCard.backgroundColor = .white
        
        imageViewCard.image = UIImage(named: "Contaminacion")
        imageViewCard.layer.cornerRadius = 15
        
        btnGoDetailCard.backgroundColor = .white
        btnGoDetailCard.tintColor = ThemeColors.verdePrimary
        
        
        
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        
        delegate?.goToDetail(btnGo: btnGoDetailCard)
        
    }
}
