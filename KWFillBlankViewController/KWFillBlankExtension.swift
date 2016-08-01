//
//  KWFillBlankExtension.swift
//  KWFillBlankTextView
//
//  Created by 一折 on 16/7/31.
//  Copyright © 2016年 yizhe. All rights reserved.
//

import UIKit

extension String{
    var length: Int{
        return self.characters.count
    }
}

extension UIColor{
    class var KWBlue:UIColor { return UIColor(red: 23.0/255, green: 113.0/255, blue: 246.0/255, alpha: 1) }
    class var KWYellow:UIColor { return UIColor(red: 247.0/255, green: 175.0/255, blue: 0/255, alpha: 1) }
    class var KWRed:UIColor { return UIColor(red: 222.0/255, green: 42.0/255, blue: 39.0/255, alpha: 1) }
    class var KWGreen:UIColor { return UIColor(red: 54.0/255, green: 155.0/255, blue: 61.0/255, alpha: 1) }
}