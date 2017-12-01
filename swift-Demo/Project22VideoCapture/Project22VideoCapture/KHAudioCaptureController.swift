//
//  KHAudioCaptureController.swift
//  Project22VideoCapture
//
//  Created by zhouxinfang on 2017/12/1.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit
import AVKit

class KHAudioCaptureController: UIViewController,AVAudioRecorderDelegate,AVAudioPlayerDelegate {

    var audioRecorder:AVAudioRecorder!
    
    var audioPlayer:AVAudioPlayer!
    
    let audioSession = AVAudioSession.sharedInstance()
    
    let recoredParams = [AVSampleRateKey:NSNumber.init(value: 44100.0),AVFormatIDKey:NSNumber.init(value: Int32(kAudioFormatMPEG4AAC)),AVNumberOfChannelsKey:NSNumber.init(value: 1),AVEncoderAudioQualityKey:NSNumber.init(value: Int32(AVAudioQuality.medium.rawValue))]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.title = "语音录制"
        self.checkPermission()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func startRecording()
    {
        if let audioPlayer = audioPlayer, audioPlayer.isPlaying
        {
            audioPlayer.stop()
        }
        if !audioRecorder.isRecording
        {
            do
            {
                try audioSession.setActive(true)
                audioRecorder.record()
            }
            catch let error as NSError
            {
                print(error)
            }
        }
    }
 
    
    @IBAction func stopRecording()
    {
        if audioRecorder.isRecording
        {
            audioRecorder.stop()
            do
            {
                try self.audioSession.setActive(false)
            }
            catch let error as NSError
            {
                print(error)
            }
        }
    }
    
    @IBAction func startPlaying()
    {
        if audioRecorder.isRecording
        {
            self.stopRecording()
        }
        else
        {
            do
            {
                let url:URL? = audioRecorder.url
                if let url = url
                {
                    try self.audioPlayer = AVAudioPlayer.init(contentsOf: url)
                    self.audioPlayer.delegate = self
                    self.audioPlayer.play()
                }
            }
            catch let error as NSError
            {
                print(error)
            }
        }
    }
    
    
    
    
    func directoryURL() -> URL
    {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory =  urls[0]
        let soundURL = documentDirectory.appendingPathComponent("sound.m4a")
        return soundURL
    }

    func checkPermission()
    {
        audioSession.requestRecordPermission { (allowed) in
            if !allowed
            {
                let alertViewController = UIAlertController.init(title: "无法访问您的麦克风", message: "请到设置->隐私->麦克风，打开访问权限", preferredStyle: UIAlertControllerStyle.alert)
                let alertAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.cancel, handler: nil)
                alertViewController.addAction(alertAction)
                self.navigationController?.show(alertViewController, sender: nil)
            }
            if allowed
            {
                do
                {
                    try self.audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
                    try self.audioRecorder = AVAudioRecorder.init(url: self.directoryURL() , settings: self.recoredParams)
                    self.audioRecorder.delegate = self
                    self.audioRecorder.prepareToRecord()
                }catch let error as NSError
                {
                    print(error)
                }
            }
        }
    }

}
