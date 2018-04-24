//
//  ViewController.swift
//  TotalCalculator
//
//  Created by Sukumar Anup Sukumaran on 23/04/18.
//  Copyright © 2018 AssaRadviewTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = 0
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true {
            
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
            
        } else {
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
        }
        
        
    }
    
    
    @IBAction func buttonActions(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12 {   // Divide
                label.text = "/"
                
            } else  if sender.tag == 13 {   // Multiply
                label.text = "X"
                
            } else  if sender.tag == 14 {   // Minus
                label.text = "-"
                
            } else if sender.tag == 15 {   // Plus
                label.text = "+"
            }
            
            operation = sender.tag
            performingMath = true
            
        } else if sender.tag == 16 {
            
            if operation == 12 {
                let AnsNum = previousNumber / numberOnScreen
                
                
                label.text = forTrailingZero(temp: AnsNum)
                
            } else if operation == 13 {
                
                let AnsNum = previousNumber * numberOnScreen
                
                
                label.text = forTrailingZero(temp: AnsNum)
                
              
                
            } else if operation == 14 {
                
                let AnsNum = previousNumber - numberOnScreen
                
                
                label.text = forTrailingZero(temp: AnsNum)
                
               
                
            } else if operation == 15 {
                
                let AnsNum = previousNumber + numberOnScreen
                
                print(" num = \(forTrailingZero(temp: AnsNum))")
                
                label.text = String(previousNumber + numberOnScreen)
            }
            
        } else if  sender.tag == 11{
            
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            
        }
        
        
        
    }
    
    func forTrailingZero(temp: Double) -> String {
        
        let tempVar = String(format: "%g", temp)
        return tempVar
    }
    

}



