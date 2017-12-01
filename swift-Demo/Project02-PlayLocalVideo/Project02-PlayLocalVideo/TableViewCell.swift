//
//  TableViewCell.swift
//  Project02-PlayLocalVideo
//
//  Created by zhouxinfang on 2017/10/18.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

struct VideoInfo
{
    var videoImageName:String
    var videoTitle:String
    var videoSource:String
}

class TableViewCell: UITableViewCell
{

    @IBOutlet weak var videoImageView:UIImageView!
    
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    @IBOutlet weak var videoSourceLabel: UILabel!

    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func layoutTableCellWithVideoInfo(_ videoInfo:VideoInfo)
    {
        videoTitleLabel.text = videoInfo.videoTitle
        videoImageView.image = UIImage(named:videoInfo.videoImageName)
    }

}
