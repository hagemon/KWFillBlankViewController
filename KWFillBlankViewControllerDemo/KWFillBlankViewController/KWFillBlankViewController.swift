//
//  KWFillBlankViewController.swift
//  KWFillBlankTextView
//
//  Created by 一折 on 16/7/31.
//  Copyright © 2016年 yizhe. All rights reserved.
//

public protocol KWFillBlankDelegate {
    func fillBlankView(fillBlankView:UIView, didSelectedBlankRange range:NSRange)->Void
}

import UIKit

class KWFillBlankViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate,KWInputBarDelegate {

    var textView:KWFillBlankTextView!
    var inputBar:KWInputBar!
    var delegate:KWFillBlankDelegate!
    private var selectedRange:NSRange!
    
    var showInputBar:Bool! = true{
        willSet{
            self.showInputAction()
        }
    }
    
    init(contentText:String, withTextViewFrame frame:CGRect=CGRectZero, blankTag:String="_"){
        super.init(nibName: nil, bundle: nil)
        var textViewFrame:CGRect = frame
        if frame == CGRectZero {
            textViewFrame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height-44)
        }
        self.textView = KWFillBlankTextView(contentText: contentText,frame: textViewFrame,blankTag: "_")
        self.view.addSubview(self.textView)
        self.textView.delegate = self

        
        let inputFrame = CGRectMake(0, self.view.frame.height-44, self.view.frame.width, 44)
        self.inputBar = KWInputBar(frame: inputFrame)
        self.showInputBar = true
        self.inputBar.inputField.delegate = self
        self.inputBar.delegate = self
        showInputAction()
        
        self.listenToKeyboard()
        let tap = UITapGestureRecognizer(target: self, action: #selector(KWFillBlankViewController.keyBoardResign))
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(KWFillBlankViewController.keyBoardResign))
        swipe.direction = .Down
        self.textView.addGestureRecognizer(tap)
        self.textView.addGestureRecognizer(swipe)
    }
    
    private func showInputAction(){
        if showInputBar == true {
            self.view.addSubview(self.inputBar)
        }
        else{
            self.inputBar.removeFromSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        if URL.absoluteString == "blank" {
            self.inputBar.inputField.becomeFirstResponder()
            self.selectedRange = characterRange
            self.textView.highlightTextInRange(characterRange)
            self.textView.updateRange(characterRange)
            self.inputBar.inputField.text = self.textView.selectedText()
            if self.delegate != nil {
                self.delegate.fillBlankView(self.view, didSelectedBlankRange: characterRange)
            }
            return false
        }
        return true
    }
    
    func keyBoardResign(){
        self.inputBar.inputField.resignFirstResponder()
    }
    
    func listenToKeyboard(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(KWFillBlankViewController.changeInputBarPosition(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)
    }
    func changeInputBarPosition(notif:NSNotification){
        let userinfo = notif.userInfo
        var start = userinfo![UIKeyboardFrameBeginUserInfoKey]?.description
        var end = userinfo![UIKeyboardFrameEndUserInfoKey]?.description
        if ((start?.hasPrefix("NSRect")) != nil) {
            start = start?.stringByReplacingOccurrencesOfString("NSRect", withString: "CGRect")
        }
        if ((end?.hasPrefix("NSRect")) != nil) {
            end = end?.stringByReplacingOccurrencesOfString("NSRect", withString: "CGRect")
        }
        let startRect = CGRectFromString(start!)
        let endRect = CGRectFromString(end!)
        let changeY = startRect.origin.y - endRect.origin.y
        
        var frame = self.inputBar.frame
        frame.origin.y = frame.origin.y - changeY
        UIView.animateWithDuration(0.25, animations: {
            self.inputBar.frame = frame
        })
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.doneBlank()
        return true
    }
    
    func doneBlank() {
        if selectedRange == nil {
            return
        }
        let text = self.inputBar.inputField.text
        if text == nil {
            return
        }
        if text?.length != 0 {
            self.textView.changeText(self.inputBar.inputField.text!, inRange: self.selectedRange)
        }
        else{
            self.textView.updateRange(self.selectedRange)
        }
        selectedRange = self.textView.selectedBlankRange()
        self.textView.highlightTextInRange(selectedRange)
        self.inputBar.inputField.text = self.textView.nextText()
    }
    
}
