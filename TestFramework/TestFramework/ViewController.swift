//
//  ViewController.swift
//  TestFramework
//
//  Created by Nathan Hsiao on 3/14/2560 BE.
//  Copyright © 2560 Nathan Hsiao. All rights reserved.
//

import UIKit
import NathanFramework
class ViewController: NathanController{
    override func viewDidLoad() {
        super.viewDidLoad()
        imgarry = [user_images(label:"GoGo",image:"earth"),user_images(label: "MakeFriend", image: "earth2"),user_images(label: "ChinMan", image: "earth3"),user_images(label: "DuckMan", image: "silp")]
        
        
    }
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

