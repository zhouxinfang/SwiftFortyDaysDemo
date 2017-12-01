//
//  ViewController.swift
//  Project11 - PhotoGesture
//
//  Created by zhouxinfang on 2017/11/3.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate{

    @IBOutlet var imageView:UIImageView!
    
    @IBOutlet var slider:UISlider!

    var currentScaleFactor : CGFloat! = 0

    lazy var context: CIContext = {
        return CIContext(options: nil)
    }()
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        self.setImageEffect()
        imageView.isUserInteractionEnabled = true
        let rotationGesture = UIRotationGestureRecognizer.init(target: self, action: #selector(ViewController.rotationGesture(sender:)))
        rotationGesture.delegate = self

        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.pinchGesture(sender:)))
        pinchGesture.delegate = self
        imageView.addGestureRecognizer(pinchGesture)
        imageView.addGestureRecognizer(rotationGesture)

    }
    
    @IBAction func sliderValueChangeAction(sender:UISlider)
    {
        print("slider value did change")

        self.setImageEffect()
    }
    
    func setImageEffect()
    {
        let image = imageView.image
        //获取原始图片
        let inputImage =  CIImage(image: image!)
        //使用高斯模糊滤镜
        let filter = CIFilter(name: "CIGaussianBlur")!
        filter.setValue(inputImage, forKey:kCIInputImageKey)
        //设置模糊半径值（越大越模糊）
        filter.setValue(slider.value, forKey: kCIInputRadiusKey)
        let outputCIImage = filter.outputImage!
        let rect = CGRect(origin: CGPoint.zero, size: (image?.size)!)
        let cgImage = context.createCGImage(outputCIImage, from: rect)
        //显示生成的模糊图片
        imageView.image = UIImage(cgImage: cgImage!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func rotationGesture(sender: UIRotationGestureRecognizer)
    {
        print("rotationGesture did become active")
        let scaleTransform = CGAffineTransform.init(scaleX: currentScaleFactor, y: currentScaleFactor)
        let rotationTransform = CGAffineTransform.init(rotationAngle: sender.rotation)
        let combineTransform = scaleTransform.concatenating(rotationTransform)
        imageView.transform = combineTransform
    }
    
    @objc func pinchGesture(sender: UIPinchGestureRecognizer)
    {
        currentScaleFactor = sender.scale
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool
    {
        return true
    }
}

