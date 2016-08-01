//
//  ViewController.swift
//  KWFillBlankTextView
//
//  Created by 一折 on 16/7/30.
//  Copyright © 2016年 yizhe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,KWFillBlankDelegate,UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // - UITextViewDelegate
    // - For KWFillBlankTextView
    // - Using with storyboard
    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        if URL.absoluteString == "blank"{
            //type your code here
            print("Blank clicked")
            return false
        }
        return true
    }
    
    // - Using with code
    @IBAction func pushToNextView(sender: AnyObject) {
        let text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore _____ aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco _____ nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat _____ pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt www.google.com anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        
        let blankViewController = KWFillBlankViewController(contentText: text)
        blankViewController.delegate = self
        blankViewController.title = "Controller Demo"
        self.navigationController?.pushViewController(blankViewController, animated: true)
    }
    
    // - KWFillBlankDelegate
    func fillBlankView(fillBlankView: UIView, didSelectedBlankRange range: NSRange) {
        //type your code here
    }

}

