//
//  VideoTableViewCell.swift
//  youtube
//
//  Created by Ryan Helgeson on 9/9/20.
//  Copyright © 2020 Ryan Helgeson. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell( _ v: Video) {
        
        //Get video
        self.video = v
        
        //Ensure that we have a video
        guard self.video != nil else {
            return
        }
        
        //Set title label
        self.titleLabel.text = video?.title
        
        //NSDateFormatter.com can be used to find date formats
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        //Set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        //Check cach before downloading
        if let cachedData =
            CacheManager.getVideoCache(self.video!.thumbnail) {
            //Set the thumbnail imageview
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        //Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        //Get the shared URL Session object
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                //Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                //Check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                if url!.absoluteString != self.video?.thumbnail {
                    //Video cell has been recycled for antoher video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                //Create the image objet
                let image = UIImage(data: data!)
                
                //Set imageView
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
            }
        }
        
        //Start tget data task
        dataTask.resume()
    }

}
