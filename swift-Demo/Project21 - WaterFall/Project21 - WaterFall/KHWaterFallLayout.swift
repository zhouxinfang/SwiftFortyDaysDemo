//
//  KHWaterFallLayout.swift
//  Project21 - WaterFall
//
//  Created by zhouxinfang on 2017/11/24.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

@objc protocol KHWaterFallLayoutDelegate
{
    //每个item的高度
    func waterFallLayout(waterFall:KHWaterFallLayout, heightForItemAtIndex:Int,itemWidth:CGFloat) -> CGFloat
    
    //共多少列
    func columnCount(waterFall:KHWaterFallLayout) -> Int
    
    //每列之间的间距
    @objc optional func columnMargin(waterFall:KHWaterFallLayout) -> CGFloat
    
    //每行之间的间距
    @objc optional func rowMargin(waterFall:KHWaterFallLayout) -> CGFloat
    
    //每个item的内边距
    @objc optional func edgeInsetd(waterFall:KHWaterFallLayout) -> UIEdgeInsets
}



class KHWaterFallLayout: UICollectionViewLayout {

    //默认的列数
    static var kDefaultColunmCount:CGFloat = 2.0

    //每一列之间的间距
    static var kDefaultColunmMargin:CGFloat = 12;
    
    //每一行之间的间距
    static var kDefaultRowMargin:CGFloat = 10;
    
    //内边距
    static var kDefaultEdgeInsets:UIEdgeInsets = UIEdgeInsets.init(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0);

    //内容的高度
    var contentHeight:CGFloat = 0.0
    
    var delegate:KHWaterFallLayoutDelegate?
    
    lazy var attrsArray:NSMutableArray = {
        let array = NSMutableArray.init()
        return array
    }()
    
    
    lazy var columnHeights:NSMutableArray = {
        let array = NSMutableArray.init()
        return array
    }()
    
    init(delegate:KHWaterFallLayoutDelegate)
    {
        self.delegate = delegate
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getColumnCount() -> Int
    {
        if let delegate = delegate
        {
            return delegate.columnCount(waterFall: self)
        }
        else
        {
            return Int(KHWaterFallLayout.kDefaultColunmCount)
        }
    }
    
   
    func getColumnMargin() -> CGFloat
    {
        if let delegate = delegate
        {
            let floatvalue = delegate.columnMargin?(waterFall: self)
            if let floatvalue = floatvalue
            {
                return floatvalue
            }
            else
            {
                return KHWaterFallLayout.kDefaultColunmMargin
            }
        }
        else
        {
            return KHWaterFallLayout.kDefaultColunmMargin
        }
    }
    
    func getRowMargin() -> CGFloat
    {
        if let delegate = delegate
        {
            let floatvalue = delegate.rowMargin?(waterFall: self)
            if let floatvalue = floatvalue
            {
                return floatvalue
            }
            else
            {
                return KHWaterFallLayout.kDefaultRowMargin
            }
        }
        else
        {
            return KHWaterFallLayout.kDefaultRowMargin
        }
    }
    
    
    func getEdgeInsets() -> UIEdgeInsets
    {
        if let delegate = delegate
        {
            let edgeInsetd = delegate.edgeInsetd?(waterFall: self)
            if let edgeInsetd = edgeInsetd
            {
                return edgeInsetd
            }
            else
            {
                return KHWaterFallLayout.kDefaultEdgeInsets
            }
            
        }
        else
        {
            return KHWaterFallLayout.kDefaultEdgeInsets
        }
    }
    
    
    override func prepare()
    {
        super.prepare()
        self.contentHeight = 0.0
        self.columnHeights.removeAllObjects()

        for _ in 0..<Int(KHWaterFallLayout.kDefaultColunmCount)
        {
            self.columnHeights.add(NSNumber.init(value: Float(KHWaterFallLayout.kDefaultEdgeInsets.top)))
        }
        self.attrsArray.removeAllObjects()
        let count = self.collectionView?.numberOfItems(inSection: 0);
        if let itemsCount = count
        {
            for index in 0..<itemsCount
            {
                let indexPath = IndexPath.init(item: index, section: 0)
                let attributes = self.layoutAttributesForItem(at:indexPath)
                self.attrsArray.add(attributes as Any)
                
            }
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes?
    {
        let attribute = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
        let collectionViewWidth = self.collectionView?.frame.size.width
        
        
        if let collectionViewWidth = collectionViewWidth
        {
            let cellWidth = (collectionViewWidth - self.getEdgeInsets().left - self.getEdgeInsets().right - (CGFloat(self.getColumnCount()) - 1)*self.getColumnMargin()) / CGFloat(self.getColumnCount());
            
            let cellHeight = self.delegate?.waterFallLayout(waterFall: self, heightForItemAtIndex: indexPath.row, itemWidth: cellWidth)
            
            if let cellHeight = cellHeight
            {
                // 找出最短的那一列
                var destColumn = 0;
                
                var minColumnHeight:Float = self.columnHeights[0] as! Float
                
                for index in 0..<Int(KHWaterFallLayout.kDefaultColunmCount)
                {
                    // 取得第i列的高度
                    let columnHeight:Float = self.columnHeights[index] as! Float
                    if (minColumnHeight > columnHeight)
                    {
                        minColumnHeight = columnHeight;
                        destColumn = index;
                    }
                }
                
                let cellX = self.getEdgeInsets().left + CGFloat(destColumn) * (cellWidth + self.getColumnMargin());
                var cellY = CGFloat(minColumnHeight);
                if (cellY != self.getEdgeInsets().top)
                {
                    cellY += self.getRowMargin();
                }
                
                attribute.frame = CGRect.init(x: cellX, y: cellY, width: cellWidth, height: cellHeight);
                
                // 更新最短那一列的高度
                self.columnHeights[destColumn] = attribute.frame.maxY;
                
                // 记录内容的高度 - 即最长那一列的高度
                let maxColumnHeight = self.columnHeights[destColumn] as! CGFloat;
                if (self.contentHeight < maxColumnHeight)
                {
                    self.contentHeight = maxColumnHeight;
                }
            }
        }
        
        return attribute;
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]?
    {
        return (self.attrsArray as! [UICollectionViewLayoutAttributes]);

    }
    
    override var collectionViewContentSize: CGSize
    {
        return CGSize.init(width: 0.0, height: self.contentHeight + self.getEdgeInsets().bottom);

    }

}

