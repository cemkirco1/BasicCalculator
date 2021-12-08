//
//  ButtonDesing.swift
//  BasicCalculator
//
//  Created by cem on 6.12.2021.
//

import Foundation
import UIKit




struct desingModelButton
{
    func ovalButton(_ Name: UIButton)
    {
        Name.layer.cornerRadius = 50
    }
    
    
    func buttonShadow(_ Name : UIButton)
    {
        Name.layer.shadowColor = UIColor.black.cgColor
         Name.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
         Name.layer.masksToBounds = false
         Name.layer.shadowRadius = 1.0
         Name.layer.shadowOpacity = 0.55
        
        
    }
    
    
    
    
    // mark: oval   ClearButton.layer.cornerRadius = 50
       
     //  ClearButton.layer.cornerRadius = 50
      /* ClearButton.layer.shadowColor = UIColor.black.cgColor
       ClearButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
       ClearButton.layer.masksToBounds = false
       ClearButton.layer.shadowRadius = 1.0
       ClearButton.layer.shadowOpacity = 0.5
       ClearButton.layer.cornerRadius = ClearButton.frame.width / 2
     */
       
    
    
}
