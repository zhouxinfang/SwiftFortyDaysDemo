//
//  ViewController.swift
//  Project19 - Carousel
//
//  Created by zhouxinfang on 2017/11/21.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!

    var images:NSArray = [UIImage.init(named: "bodyline"),UIImage.init(named: "darkvarder"),UIImage.init(named: "dudu"),UIImage.init(named: "hello")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KHCollectionCellIdentifier", for: indexPath) as! KHCollectionCell
        
        let row = indexPath.row
        if row >= 0 && row < images.count
        {
            cell.updateImageView(image: images[row] as! UIImage)
        }
        return cell
        
    }

}

