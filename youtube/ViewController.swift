//
//  ViewController.swift
//  youtube
//
//  Created by Ryan Helgeson on 9/4/20.
//  Copyright © 2020 Ryan Helgeson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate =  self
        
        //Set itself as the delegate of model
        model.delegate = self
        
        model.getVideos()
    }

    func videosFetched(_ videos: [Video]) {
        //Set the returned videos to our video property
        self.videos = videos
        
        //Refresh the tableView
        tableView.reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        //Configure the cell with the data
        //Get the title for the video in the question
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        //Return the cell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

