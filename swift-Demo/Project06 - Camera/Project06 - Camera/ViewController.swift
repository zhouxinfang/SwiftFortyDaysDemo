//
//  ViewController.swift
//  Project06 - Camera
//
//  Created by zhouxinfang on 2017/10/20.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func takePhotoButtonDidClick(sender:AnyObject)
    {
        let camera = UIImagePickerController()
        camera.allowsEditing = false
        camera.sourceType = UIImagePickerControllerSourceType.camera
        camera.delegate = self
        self.present(camera, animated: true) {
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(ViewController.savePhotoAlbum(image:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    
    

    
    @objc func savePhotoAlbum(image: UIImage,didFinishSavingWithError error:NSError?, contextInfo:AnyObject)
    {
        if error != nil
        {
            let alertViewController = UIAlertController.init(title: "温馨提示", message:"保存失败", preferredStyle: .alert)
            self.present(alertViewController, animated: true, completion: nil)

        }
        else
        {
            self.dismiss(animated: true, completion:
                {
                let alertViewController = UIAlertController.init(title: "温馨提示", message:"保存成功", preferredStyle: .alert)
                    let closeAction = UIAlertAction.init(title: "关闭", style: .cancel, handler: { (alert:UIAlertAction) in
                        print("完成")
                    })
                    
                    alertViewController.addAction(closeAction)
                self.present(alertViewController, animated: true, completion:nil)
            })
            
        }
    }
    
    
}

