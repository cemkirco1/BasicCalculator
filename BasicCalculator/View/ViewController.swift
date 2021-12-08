//
//  ViewController.swift
//  BasicCalculator
//
//  Created by cem on 5.12.2021.
//

import UIKit

class ViewController: UIViewController {
      
    
    @IBOutlet weak var label: UITextField!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var hideLabel: UILabel!
    

    var numberOnScreen: Int = 0
    var twoNumberOnScreen: Int = 0
    var previousNumber: Int = 0
    var performingMath = false
    var process = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //  desingButton()
    }
    
    @IBAction func numbers(_ sender: UIButton)
    {
        
        if performingMath == true
        {
            hideLabel.text = String(sender.tag)
            twoNumberOnScreen = Int(hideLabel.text!)!
            performingMath = false
        }
        else
        {
            hideLabel.text = hideLabel.text! + String(sender.tag)
            twoNumberOnScreen = Int(hideLabel.text!)!
            
        }
       
        
        label.text = label.text! + String(sender.tag)
        
        numberOnScreen = Int(label.text!) ?? 0
        
        
    }
    
    
    
    @IBAction func buttons(_ sender: UIButton)
    {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 17
        {
            previousNumber = Int(hideLabel.text!)!
           
            if sender.tag == 13 //divide
            {
                label.text = label.text! + "/"
            }
            else if sender.tag == 14 //multiply
            {
                label.text = label.text! + "x"
            }
            else if sender.tag == 15 //minus
            {
                label.text = label.text! + "-"
            }
            else if sender.tag == 16 //plus
            {
                label.text = label.text! + "+"
            }
            else if sender.tag == 17
            {
                
            }
            else if sender.tag == 11
            {
                label.text = "0"
            }
            process = sender.tag
            performingMath = true
            
        }
        else if sender.tag == 17
        {
            if process == 12
            {
                label.text = String(previousNumber)
            }
           else if process == 13
            {
            label.text = String(previousNumber / twoNumberOnScreen)
            }
           else if process == 14
            {
            label.text = String(previousNumber * twoNumberOnScreen)
            }
           else if process == 15
            {
            label.text = String(previousNumber - twoNumberOnScreen)
            }
           else if process == 16
            {
            label.text = String(previousNumber + twoNumberOnScreen)
            }
          
           else if process == 18
            {
            label.text?.removeLast()
            }
          
            
        }
        else if sender.tag == 11
        {
            label.text = ""
            hideLabel.text = ""
            process = 0
            numberOnScreen = 0
            previousNumber = 0
            twoNumberOnScreen = 0
        }
    }
}
