//
//  DetailViewController.swift
//  Storm Viewer
//
//  Created by Daniel Gilbert on 10/12/17.
//  Copyright © 2017 Daniel Gilbert. All rights reserved.
//

import UIKit
import CleanroomLogger

class DetailViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    
    // MARK: - UIViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let imageToLoad = selectedImage {
            Log.message(.info, message: "Displaying image - \(selectedImage!)")
            imageView.image = UIImage(named: imageToLoad)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
