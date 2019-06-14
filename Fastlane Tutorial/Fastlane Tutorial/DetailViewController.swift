//
//  DetailViewController.swift
//  Fastlane Tutorial
//
//  Created by Mohammad Arafat Hossain on 6/14/19.
//  Copyright © 2019 M. Arafat. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, SeaugueLoading {
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.animationRepeatCount = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            let animatedImage = UIImage.gifImageWithName("animated_image")
            DispatchQueue.main.async { [weak self] in
                self?.imageView.image = animatedImage
            }
        }
    }
}
