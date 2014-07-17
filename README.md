# Zwoptex with cocos2d v3

This is a simple sample project showing command line integration with Zwoptex and cocos2d v3. 

## Requirements

* Xcode 6 Beta 3 or later
* Cocoapods

## Install

1. Clone this repository
2. Open the root folder in terminal and run `pod install`
3. Open the `zwoptex-cocos2d.xcworkspace`

## Setup

### Folders & Files

* `Assets` folder contains our sprite sheet assets
* `zwoptex-cocos2d` folder contains our project source code

### Command Line Integration

In the `Assets` folder you will find a `sprites.json` file and `sprites` folder. The `sprites.json` file is the command line configuration the project will use. If you open it up with any text editor you can follow through how it’s setup. The general idea is to take the `sprites` folder and run them through Zwoptex when Xcode is building the project and output the resulting coordinates, textures and manifest file directly into the app that Xcode builds. You will see the `$(BUILT_PRODUCTS_DIR)` and `$(SOURCE_ROOT)` environment variables that Xcode gives us being used to achieve this.

The advantage to outputing the final files directly into the built products directory is that a clean and build will ensure the sprite sheets are always re-generated.

### App Integration

Inside of the `AppDelegate.swift` is example of how to integrate the new manifest file Zwoptex provides for when you pack more than one sheet and also load them into the cocos2d sprite frame cache and place a sprite in the scene

## License

The MIT License (MIT)

Copyright (c) 2014 Zwopple Limited

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

