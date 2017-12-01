//
//  SnowView.swift
//  Project12 - EffectiveLogin
//
//  Created by zhouxinfang on 2017/11/6.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class SnowView: UIView {

    let emitterLayer:CAEmitterLayer = CAEmitterLayer()
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        let rect = CGRect(x: 0.0, y: -20, width: self.bounds.width,
                          height: self.bounds.height)
        emitterLayer.frame = rect
        emitterLayer.emitterSize = rect.size
        self.backgroundColor = UIColor.black
        emitterLayer.backgroundColor = UIColor.clear.cgColor
        emitterLayer.emitterPosition = CGPoint(x: rect.width/2, y: rect.origin.y)
        self.layer.addSublayer(emitterLayer)
        emitterLayer.emitterShape = kCAEmitterLayerRectangle;
        //背景雪
        let backgroundEmitterCell = self.getSnowBackgroundEmitterCell()
        //前景雪
        let forgroundEmitterCell = self.getSnowForgroundEmitterCell()
        
        emitterLayer.emitterCells = [backgroundEmitterCell,forgroundEmitterCell];
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //雪的后面一层，较小雪花效果
    func getSnowBackgroundEmitterCell() ->(CAEmitterCell)
    {
        //create new emitter cell
        let emitterCell:CAEmitterCell = CAEmitterCell()
        emitterCell.contents = UIImage(named: "snow")?.cgImage
        emitterCell.name = "backgroudSnow";
        //get the particles start color
        emitterCell.color = UIColor.init(white: 1.0, alpha: 0.3).cgColor;
        
        emitterCell.birthRate = 80.0;
        emitterCell.lifetime = 25;
        emitterCell.lifetimeRange = 5;
        //初始速度，小雪花的初始速度要小，重量轻
        emitterCell.velocity = 50;
        emitterCell.velocityRange = 20;
        
//        emitterCell.emissionLatitude = 1.0;
        emitterCell.emissionLongitude = CGFloat.pi/2;
        //粒子发射角度的范围,因为是小雪花，所以发射角度要小一些，暂定60°
        emitterCell.emissionRange = CGFloat.pi/6;
        
        //小雪花的加速度小
        emitterCell.xAcceleration = -1;
        emitterCell.yAcceleration = 6;
        emitterCell.zAcceleration = 0;
        emitterCell.alphaRange = 0.6;
        emitterCell.alphaSpeed = 0.0;
        
        emitterCell.scale = 0.15;
        emitterCell.scaleRange = 0.3;
        emitterCell.scaleSpeed = 0.0;
        
        emitterCell.spin = 0;
        emitterCell.spinRange = 0;
        
        emitterCell.redSpeed = 0;
        emitterCell.redRange = 0;
        
        emitterCell.greenSpeed = 0;
        emitterCell.greenRange = 0;
        
        emitterCell.blueSpeed = 0;
        emitterCell.blueRange = 0;
        return emitterCell;
    }
    
    func getSnowForgroundEmitterCell() ->(CAEmitterCell)
    {
        let emitterCell:CAEmitterCell = CAEmitterCell.init()
        //粒子图片
        emitterCell.contents = UIImage(named: "snow")?.cgImage
        //粒子源名称
        emitterCell.name = "forgroudSnow";
        emitterCell.color = UIColor.init(white: 1.0, alpha: 0.6).cgColor;
        emitterCell.birthRate = 20;
        //生命周期秒
        emitterCell.lifetime = 25;
        
        //生命周期范围
        emitterCell.lifetimeRange = 10;
        
        //速度
        emitterCell.velocity = 100;
        
        //速度范围
        emitterCell.velocityRange = 20;
        
        //粒子在Z轴方向的发射角度(弧度)
//        emitterCell.emissionLatitude = 1.4;
        
        //xy平面的发射角度(弧度)
        emitterCell.emissionLongitude = CGFloat.pi/2;
        
        //粒子发射角度的范围,因为是大雪花，所以发射角度要小一些，暂定30°
        emitterCell.emissionRange = CGFloat.pi/12;
        
        //大雪花，所以加速度要大一些，z方向加速度为0
        emitterCell.xAcceleration = -0.5;
        emitterCell.yAcceleration = 20;
        emitterCell.zAcceleration = 0;
        
        //透明度
        emitterCell.alphaRange = 0.2;
        //透明度变化速度
        emitterCell.alphaSpeed = 0.0;
        
        //缩放
        emitterCell.scale = 0.4;
        emitterCell.scaleRange = 0.3;
        emitterCell.scaleSpeed = 0.0;
        
        //旋转
        emitterCell.spin = 8;
        emitterCell.spinRange = 4;
        
        //粒子在rgb三个色相上的容差和透明度的容差
        emitterCell.redSpeed = 0;
        emitterCell.redRange = 0;
        
        emitterCell.greenSpeed = 0;
        emitterCell.greenRange = 0;
        
        emitterCell.blueSpeed = 0;
        emitterCell.blueRange = 0;
        return emitterCell;
    }

}

