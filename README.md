KWFillBlankViewController
=====
[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)

A view controller can fill blank in text view

- There is a demo in the project above

Components
-----
####KWFillBlankViewController

<p align="center">
<img style="-webkit-user-select: none;" src="./KWFillBlankViewController.gif" width="320" height="628">
</p>

- Remember to press for a while when you click blanks with Xcode Simulator
- The default blank is "_"
- Using by code beneath

``` swift
let text = "your _____ text _____ here "
let blankViewController = KWFillBlankViewController(contentText: text)
self.navigationController?.pushViewController(blankViewController, animated: true)
```

- If you want to do something when clicking the blank ,just using code beneath

``` swift
blankViewController.delegate = self
```

- And complete this delegate

``` swift
func fillBlankView(fillBlankView: UIView, didSelectedBlankRange range: NSRange)
```
####KWFillBlankTextView

<p align="center">
<img style="-webkit-user-select: none;" src="./KWFillBlankTextView.gif" width="320" height="628">
</p>

- KWFillBlankTextView is a subclass of UITextView
- It can be used independently
- You can set blank tag in the storyboard

<p align="center">
<img style="-webkit-user-select: none;" src="./KWFillBlankTextView.png" width="241" height="47">
</p>

- If you want to do something when clicking hte blank ,just follow the UITextViewDelegate and using code beneath

```swift
func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        if URL.absoluteString == "blank"{
            //type your code here
            return false
        }
        return true
    }
```
Installation
-----