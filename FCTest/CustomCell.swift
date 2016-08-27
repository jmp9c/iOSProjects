//
//  CustomCell.swift
//  FCTest
//
//  Created by John Peden on 5/20/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class CustomCell: FoldingCell {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
  
  @IBOutlet var cLabel: UILabel!
  @IBOutlet var hLabel: UILabel!
  override func awakeFromNib() {
    
    foregroundView.layer.cornerRadius = 10
    foregroundView.layer.masksToBounds = true
    
    
    super.awakeFromNib()
  }
  
  override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
    
    // durations count equal it itemCount
    let durations = [0.15, 0.26, 0.26, 0.26, 0.26, 0.26] // timing animation for each view
    return durations[itemIndex]
  }
  
  

}
