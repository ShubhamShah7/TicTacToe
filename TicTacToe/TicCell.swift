//
//  TicCell.swift
//  TicTacToe
//
//  Created by DCS on 08/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class TicCell: UICollectionViewCell {
    private let imageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()
    
    func setupCell(with status:Int)
    {
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.blue.cgColor
        
        contentView.addSubview(imageView)
        imageView.frame = CGRect(x:10,y:10,width: 80,height: 80)
        
        if status == 0 {
                imageView.image = UIImage(named: "0")
        } else if status == 1{
            imageView.image = UIImage(named: "1")	
        } else {
            imageView.image = UIImage(named: "")
        }
    }
}
