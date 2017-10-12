//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Daniel Gilbert on 10/12/17.
//  Copyright © 2017 Daniel Gilbert. All rights reserved.
//

import UIKit
import CleanroomLogger

class MainTableViewController: UITableViewController {
    
    // MARK: - Properties
    var pictures = [String]()
    
    // MARK: - UIViewController Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        Log.message(.debug, message: "Fetching Pictures: \(pictures)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - TableViewController Functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let imageTitle = cell?.textLabel?.text
        
        self.performSegue(withIdentifier: "showDetail", sender: imageTitle)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let image = sender as? String, let identifier = Segues(rawValue: segue.identifier!) {
            switch identifier {
            case .detail:
                let detailVC = segue.destination as! DetailViewController
                detailVC.selectedImage = image
            }
        }
    }
}

