//
//  VideoDescriptionTableViewController.swift
//  MediaPlayer
//
//  Created by Егор Никитин on 25.02.2021.
//

import UIKit

final class VideoDescriptionTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Storage.shared.videos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdCell", for: indexPath)
        
        let video = Storage.shared.videos[indexPath.row]
        cell.textLabel?.text = video.name
        cell.textLabel?.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        cell.imageView?.image = video.previewImage
        

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToVideo" {
            let videoString = Storage.shared.videos[tableView.indexPathForSelectedRow!.row].youTubeString
            (segue.destination as! VideoViewController).youTubeString = videoString
        }
    }

}
