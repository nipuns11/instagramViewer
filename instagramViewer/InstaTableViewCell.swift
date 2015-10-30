//
//  InstaTableViewCell.swift
//  instagramViewer
//
//  Created by nipun sharma on 2015-10-28.
//  Copyright © 2015 nipun. All rights reserved.
//

import UIKit
import Haneke

class InstaTableViewCell: UITableViewCell {

    


    
    @IBOutlet weak var instaImage: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    
    
    var insta:JSON? {
        didSet{
            self.setupInsta()
        }
    }
    
    func setupInsta(){
        self.captionLabel.text = self.insta?["caption"]["text"].string
        if let urlString = self.insta?["images"]["standard_resolution"]["url"] {
            let url = NSURL(string: urlString.stringValue)
            self.instaImage.hnk_setImageFromURL(url!)
        }
    }
    
    override func prepareForReuse() {
        self.imageView?.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
