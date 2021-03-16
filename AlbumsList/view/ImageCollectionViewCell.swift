//
//  ImageCollectionViewCell.swift
//  AlbumsList
//
//  Created by OPT/LPTP/335 on 16/03/21.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
   
    let thumbImageView = UIImageView()

    override init(frame: CGRect) {
            super.init(frame: frame)
        thumbImageView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)

        thumbImageView.backgroundColor = UIColor.white
        thumbImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(thumbImageView)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
