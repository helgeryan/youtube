//
//  Constants.swift
//  youtube
//
//  Created by Ryan Helgeson on 9/4/20.
//  Copyright © 2020 Ryan Helgeson. All rights reserved.
//

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyA28C9q2Zgw1NFzbXtRGcNKgMksMt342IE"
    static var PLAYLIST_ID = "PLRdw3IjKY2gk1ugBRagRG_gc0zxjDjC8T"
    static var API_URL =
    "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
        
}
