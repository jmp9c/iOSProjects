//
//  HomeViewController.swift
//  siyman
//
//  Created by John Peden on 4/1/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  @IBOutlet weak var menuButton: UIBarButtonItem!
  @IBOutlet weak var backgroundImages: UIImageView!
  
  var images: [UIImage] = [UIImage(named: "ping-1.jpg")!,
                           UIImage(named: "tmldr-14.jpg")!,
                           UIImage(named: "DSC_3489.jpg")!,
                           UIImage(named: "IMG_0808-1.JPG")!,
                           UIImage(named: "IMG_0811-1.JPG")!,
                           UIImage(named: "IMG_7977.JPG")!,
                           UIImage(named: "MSSL-0564.jpg")!]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if self.revealViewController() != nil {
      menuButton.target = self.revealViewController()
      menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
      self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    self.backgroundImages.animationImages = images
    self.backgroundImages.animationDuration = 17.0
    self.backgroundImages.startAnimating()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
