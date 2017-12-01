//
//  ViewController.swift
//  Project21 - WaterFall
//
//  Created by zhouxinfang on 2017/11/24.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,KHWaterFallLayoutDelegate
{

    static var kShopCollectonCellIdentifier:String = "ShopCollectonCellIdentifier";
    
    
    @IBOutlet var collectionView:UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setUpCollectionView()
        self.setUpData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    lazy var attrsArray:NSMutableArray = {
        let array = NSMutableArray.init()
        return array
    }()
    
    lazy var shops:NSMutableArray =
    {
        let array = NSMutableArray.init()
        return array
    }()
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpCollectionView()
    {
        let waterFallLayout = KHWaterFallLayout.init(delegate: self)
        collectionView.dataSource = self
        collectionView.collectionViewLayout = waterFallLayout
        

    }
    
    func setUpData()
    {
        self.shops.removeAllObjects()
        
        let filePath = Bundle.main.url(forResource:"shop", withExtension: "plist")
        if let filePath = filePath
        {
            let shopDictionarys = NSArray.init(contentsOf: filePath)
            if let shopDictionarys = shopDictionarys
            {
                for dictionary in shopDictionarys
                {
                    let shop = KHShop.init(dictionary: dictionary as! NSDictionary)
                    self.shops.add(shop)
                }
            }
        }

    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.shops.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let shop:KHShop = self.shops[indexPath.row] as! KHShop;
        let cell:KHShopCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.kShopCollectonCellIdentifier , for: indexPath) as! KHShopCollectionCell
        cell.descriptionLabel.text = shop.price as String
        let imageUrl = URL.init(string: shop.image as String)
        if let url = imageUrl
        {
            let nsd = NSData.init(contentsOf: url)
            if let nsd = nsd
            {
                cell.imageView.image = UIImage.init(data: nsd as Data)
            }
        }
        
        return cell;
    }
    
    
    
    
    func waterFallLayout(waterFall:KHWaterFallLayout, heightForItemAtIndex:Int,itemWidth:CGFloat) -> CGFloat
    {
        let shop:KHShop = self.shops[heightForItemAtIndex] as! KHShop;
        
        return itemWidth * CGFloat(shop.height / shop.width);
    }
    
    
    func rowMargin(waterFall: KHWaterFallLayout) -> CGFloat
    {
        return 20;
    }
    
    func columnCount(waterFall: KHWaterFallLayout) -> Int
    {
        return 2
    }

}




