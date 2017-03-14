//
//  collectionviewcell.swift
//  Instagram
//
//  Created by Nathan Hsiao on 3/13/2560 BE.
//  Copyright © 2560 Nathan Hsiao. All rights reserved.
//

import UIKit

open class collectionviewcell: UICollectionViewCell {
    //label for each cell
    let title:UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Normal"
        title.textAlignment = .center
        title.textColor = .gray
        title.font = UIFont.boldSystemFont(ofSize: 13)
        return title
        
    }()
    //imageview for each cell
    public let imageview:UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .orange
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 0
        
    return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        addSubview(imageview)
        //label x,y,width,height
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.topAnchor.constraint(equalTo: topAnchor,constant:5).isActive = true
        title.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //imageview x,y,width,height
        imageview.topAnchor.constraint(equalTo: title.bottomAnchor,constant:5).isActive = true
        imageview.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageview.widthAnchor.constraint(equalTo: widthAnchor,constant:-10).isActive = true
        imageview.bottomAnchor.constraint(equalTo: bottomAnchor,constant:-5).isActive = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //selected text color 
   override open var isSelected: Bool {
        didSet{
            title.textColor = isSelected ? .black : .gray
        }
        
    }
}
