//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Divesh Singh on 2/28/21.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    @IBOutlet weak var tilte: UILabel!
    @IBOutlet weak var thumbImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
