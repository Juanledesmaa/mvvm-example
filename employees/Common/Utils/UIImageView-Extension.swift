//
//  UIImageView-Extension.swift
//  employees
//
//  Created by juan ledesma on 23/11/20.
//

import UIKit

extension UIImageView {
  public func maskCircle(with image: UIImage) {
    self.contentMode = UIView.ContentMode.scaleAspectFill
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.masksToBounds = false
    self.clipsToBounds = true
   self.image = image
  }
}
