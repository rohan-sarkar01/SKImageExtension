//
//  ViewController.swift
//  SKImageExtension
//
//  Created by rohan.kolkata@gmail.com on 04/07/2019.
//  Copyright (c) 2019 rohan.kolkata@gmail.com. All rights reserved.
//

import UIKit
import SKImageExtension

class ViewController: UIViewController
{

    @IBOutlet weak var testImageView: UIImageView!
    @IBOutlet weak var anotherImageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testImageView.circleImageView(borderColor: UIColor.white, borderWidth: 2.0)
        testImageView.downloadedFrom(link: "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg")
        
        anotherImageview.circleImageView(borderColor: UIColor.white, borderWidth: 2.0)
        anotherImageview.downloadAndCacheImage(link: "https://images.pexels.com/photos/257360/pexels-photo-257360.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
    }

}

