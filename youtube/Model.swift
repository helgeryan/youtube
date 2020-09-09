//
//  Model.swift
//  youtube
//
//  Created by Ryan Helgeson on 9/4/20.
//  Copyright © 2020 Ryan Helgeson. All rights reserved.
//

import Foundation


class Model {
    
    func getVideos() {
        
        //Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //Get a URLSession object
        let session = URLSession.shared
        
        //Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { ( data, respnonse,
            error) in
            
            if error != nil || data == nil {
                return
            }
            
            do {
                //Parsing Data
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
               
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            }
            catch {
                
            }
        }
        
        
        //Kick off the task
        dataTask.resume()
        
    }
}
