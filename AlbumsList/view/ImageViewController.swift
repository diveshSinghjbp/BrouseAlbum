//
//  ImageViewController.swift
//  AlbumsList
//
//  Created by OPT/LPTP/335 on 16/03/21.
//

import UIKit
import Kingfisher

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageUrlString : URL? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        imageView.kf.setImage(with: imageUrlString)

        // Do any additional setup after loading the view.
    }
    

}
