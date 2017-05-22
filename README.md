![dots_header](https://github.com/makomori/Dots/blob/master/dots_header.png "dots header")

# Dots

[![CI Status](http://img.shields.io/travis/makomori/Dots.svg?style=flat)](https://travis-ci.org/makomori/Dots)
[![Version](https://img.shields.io/cocoapods/v/Dots.svg?style=flat)](http://cocoapods.org/pods/Dots)
[![License](https://img.shields.io/cocoapods/l/Dots.svg?style=flat)](http://cocoapods.org/pods/Dots)
[![Platform](https://img.shields.io/cocoapods/p/Dots.svg?style=flat)](http://cocoapods.org/pods/Dots)

Dots is the replacement of UIActivityIndicatorView. It provides modern and highly customizable loading indicator. You can call this dots loading view from everywhere in your program with just 2 lines of code.

## GIFs
### Google color
![gif](https://github.com/makomori/Dots/blob/master/ezgif.com-video-to-gif.gif "dots gif")

### Pink gradient
![gif](https://github.com/makomori/Dots/blob/master/dots_pink.gif "pink gif")

### Twitter color
![gif](https://github.com/makomori/Dots/blob/master/dots_twitter.gif "twitter gif")


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
iOS 10.0 + 

## Installation

I've submited this pod 10 days ago, but still can't install via Cocoapods. Maybe we need to wait more. If you have any clue why we can't use this pod, let me know. Thank you.

``` ruby
pod 'DotsLoading'
```

## Usage
In your ViewController, run below.

### Show

```swift
let loadingView = DotsLoadingView(colors: nil)
self.view.addSubview(loadingView)
```

### Hide

```swift
loadingView.stop()
```

## Customization
You can use custom dot colors. 

Note: You need to create array which includes four UIColors. If you specify less than or more than 4 colors, the colors of dots will be default.

```swift
let dotColors = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow]
let loadingView = DotsLoadingView(colors: dotColors)
self.view.addSubview(loadingView)
```

## Author

makomori, makomori26@gmail.com

## License

Dots is available under the MIT license. See the LICENSE file for more info.
