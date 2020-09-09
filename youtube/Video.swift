//
//  Video.swift
//  youtube
//
//  Created by Ryan Helgeson on 9/4/20.
//  Copyright © 2020 Ryan Helgeson. All rights reserved.
//

import Foundation

struct Video : Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case published = "publishedAt"
        case snippet
        case thumbnails
        case high
        case resourceId
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init ( from decoder:Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
       
        //Parse the description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        //Parse the publsih date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        //Parse thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        //Parse High
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)

        //Parse thumbnail
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        //Parse thumbnail
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}
