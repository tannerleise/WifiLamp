//
//  ViewController.swift
//  LampController
//
//  Created by Adam Vitti on 11/11/19.
//  Copyright © 2019 AdamVitti. All rights reserved.
//

import UIKit
import Firebase

var brightness = DatabaseReference();

var R = DatabaseReference();
var G = DatabaseReference();
var B = DatabaseReference();

var flag1 = DatabaseReference();
var flag2 = DatabaseReference();

class ViewController: UIViewController {
    
    @IBOutlet weak var red: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!

    
    
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var green: UILabel!
    
    
    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var blue: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //set database refrences
        brightness = Database.database().reference().child("phoneBrightness")
        flag1 = Database.database().reference().child("flag1");
        flag2 = Database.database().reference().child("flag2");
        R = Database.database().reference().child("redValue");
        G = Database.database().reference().child("greenValue");
        B = Database.database().reference().child("blueValue");
        
        //set these values to previous read color value from server
        redSlider.setValue(100, animated: false)
        greenSlider.setValue(255, animated: false)
        blueSlider.setValue(200, animated: false)
        
        redLabel.text = (String(100));
        greenLabel.text = (String(255));
        blueLabel.text = (String(200));
        
        self.view.backgroundColor = UIColor(red: CGFloat(100)/255, green: CGFloat(255)/255, blue: CGFloat(200)/255, alpha: 1)
    }
    
    @IBAction func SliderChange(_ sender: Any) {
        let redValue = redSlider.value
        let greenValue = greenSlider.value
        let blueValue = blueSlider.value
        
        redLabel.text = (String(Int(redValue)));
        greenLabel.text = (String(Int(greenValue)));
        blueLabel.text = (String(Int(blueValue)));
        
        self.view.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
        
        R.setValue(Int(redValue))
        G.setValue(Int(greenValue))
        B.setValue(Int(blueValue))
        
    //changes text color to white if color is black
        if(self.view.backgroundColor == UIColor(red: 0, green: 0, blue: 0, alpha: 1)){
            red.textColor = UIColor(white: 1, alpha: 1);
            green.textColor = UIColor(white: 1, alpha: 1);
            blue.textColor = UIColor(white: 1, alpha: 1);
        
        }else{
            red.textColor = UIColor(white: 0, alpha: 1)
            green.textColor = UIColor(white: 0, alpha: 1);
            blue.textColor = UIColor(white: 0, alpha: 1);
        }
    }
    
    
    @IBAction func testButton(_ sender: Any) {
    //sets int
        flag1.setValue(0);
        flag2.setValue(1);
        brightness.setValue(255);
    }
    
    


}

