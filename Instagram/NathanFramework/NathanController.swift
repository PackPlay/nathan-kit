//
//  ViewController.swift
//  Instagram
//
//  Created by Nathan Hsiao on 3/13/2560 BE.
//  Copyright © 2560 Nathan Hsiao. All rights reserved.
//

import UIKit

open class NathanController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    //imageview for image selected
    //let imgarry =
    var collectionviewcellcontroller:collectionviewcell?
    var hidebutton:Bool = false
    let button:UIButton = {
        let button = UIButton(type:.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Hide", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .yellow
        return button
    }()
    public var imgarry:[user_images] = [user_images(label:nil,image:"earth"),user_images(label:nil,image:"silp"),user_images(label:nil,image:"earth2"),user_images(label:nil,image:"earth3")]
    let imageview:UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        //iv.backgroundColor = .red
        iv.image = UIImage(named: "earth")
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        return iv
        
    }()
     //collectionview
    lazy var collectionview:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
       let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.register(collectionviewcell.self, forCellWithReuseIdentifier: "cellid")
        cv.dataSource = self
        cv.delegate = self
        
        return cv
        
    }()
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageview)
        view.addSubview(collectionview)
       // view.addSubview(button)
        //imageview x,y,width,height constraint
        imageview.topAnchor.constraint(equalTo: view.topAnchor,constant:80).isActive = true
        imageview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 300).isActive = true
        //collectionview x,y,width,height constraint
        collectionview.topAnchor.constraint(equalTo: imageview.bottomAnchor,constant:50).isActive = true
        collectionview.leftAnchor.constraint(equalTo: view.leftAnchor,constant:10).isActive = true
        collectionview.rightAnchor.constraint(equalTo: view.rightAnchor,constant:-10).isActive = true
        collectionview.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.view.layoutIfNeeded()
        self.collectionview.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
        imageview.image = UIImage(named: imgarry[indexPath.item].image!)
        
    }
    override open func viewDidAppear(_ animated: Bool) {
        let indexpath = IndexPath(item: 0, section: 0)
        collectionview.selectItem(at: indexpath, animated: false, scrollPosition: UICollectionViewScrollPosition())
    }
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgarry.count
    }
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cv = collectionview.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! collectionviewcell
        cv.backgroundColor = .clear
        cv.imageview.image = UIImage(named: imgarry[indexPath.item].image!)
        cv.title.text = imgarry[indexPath.item].label
        if hidebutton {
            cv.title.isHidden = true
        }
        else
        {
            cv.title.isHidden = false
        }
        return cv
    }
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: collectionview.frame.height)
    }

}

