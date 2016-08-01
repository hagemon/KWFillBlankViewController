//
//  KWInputBar.swift
//  KWFillBlankTextView
//
//  Created by 一折 on 16/7/31.
//  Copyright © 2016年 yizhe. All rights reserved.
//

protocol KWInputBarDelegate {
    func doneBlank()
}

import UIKit

class KWInputBar: UIView {
    
    var inputField:UITextField!
    var doneButton:UIButton!
    var delegate:KWInputBarDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        let textFrame = CGRectMake(10, 5, self.frame.width-20-65, self.frame.height-10)
        self.inputField = UITextField(frame: textFrame)
        self.addSubview(inputField)
        let buttonFrame = CGRectMake(textFrame.width+textFrame.origin.x+5, textFrame.origin.y, 60, textFrame.height)
        self.doneButton = UIButton(frame:buttonFrame)
        self.addSubview(doneButton)
        setInputProperty()
        setButtonProperty()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setInputProperty(){
        self.inputField.borderStyle = .RoundedRect
        self.inputField.autocapitalizationType = .None
        self.inputField.keyboardType = .ASCIICapable
        self.inputField.returnKeyType = .Next
        self.inputField.spellCheckingType = .No
        self.inputField.autocorrectionType = .No
    }
    
    func setButtonProperty(){
        self.doneButton.backgroundColor = UIColor(red: 54.0/255.0, green: 105.0/255.0, blue: 195.0/255.0, alpha: 1)
        self.doneButton.layer.masksToBounds = true
        self.doneButton.layer.cornerRadius = 3
        self.doneButton.setTitle("Next", forState: .Normal)
        self.doneButton.addTarget(self, action: #selector(next), forControlEvents: .TouchUpInside)
    }
    
    func next(){
        if self.delegate != nil{
            self.delegate.doneBlank()
        }
    }
}
