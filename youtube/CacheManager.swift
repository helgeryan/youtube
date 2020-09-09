//
//  CacheManager.swift
//  youtube
//
//  Created by Ryan Helgeson on 9/9/20.
//  Copyright © 2020 Ryan Helgeson. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache( _ url: String, _ data:Data?) {
        
        //Store the image data and use the url as the key
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        
        //Return to get the data of the specified url
        return cache[url]
    }
}
