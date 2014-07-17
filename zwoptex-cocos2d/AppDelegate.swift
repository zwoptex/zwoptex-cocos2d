//
//  AppDelegate.swift
//  zwoptex-cocos2d
//
//  Created by Robert Payne on 17/07/14.
//  Copyright (c) 2014 Zwopple Limited. All rights reserved.
//

import UIKit
import OpenGLES

@UIApplicationMain
class AppDelegate: CCAppDelegate, UIApplicationDelegate {
    
    override func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]!) -> Bool  {
        setupCocos2dWithOptions([
            CCSetupShowDebugStats: true
        ])
        return true
    }
    
    override func startScene() -> CCScene!  {
        // create scene
        var scene = CCScene()
        
        // load manifeest
        var manifestFilePath = CCFileUtils.sharedFileUtils().fullPathForFilename("sprites.plist")
        var manifest: NSDictionary? = NSDictionary(contentsOfFile: manifestFilePath)
        
        // grab sheets in manifest
        var sheets = manifest?["sheets"] as? NSArray
        
        // iterate over every sheet in the manifest and add it to the sprite frame cache
        for var i = 0; i < sheets?.count; ++i {
            var sheet = sheets?[i] as? NSDictionary
            var coordinatesFileName = sheet?["coordinatesFileName"] as? NSString
            var textureFileName = sheet?["textureFileName"] as? NSString
            
            println(CCFileUtils.sharedFileUtils().fullPathForFilename(coordinatesFileName))
            println(CCFileUtils.sharedFileUtils().fullPathForFilename(textureFileName))
            
            CCSpriteFrameCache.sharedSpriteFrameCache().addSpriteFramesWithFile(coordinatesFileName, textureFilename: textureFileName)
        }
        
        // create a list of animation frames for our army attack artwork
        var frames: Array<CCSpriteFrame> = []
        var idx = 0;
        do {
            // use string padding to ensure we get a 4 digit index
            var frameName = String(format: "sprites/army_attack_%04d.png", idx++)
            
            // grab the frame from sprite frame cache
            var frame = CCSpriteFrameCache.sharedSpriteFrameCache().spriteFrameByName(frameName)
            
            // if we didn't get a frame break as we're likely at the end of the animation
            if !frame {
                break
            }
            
            // append frame
            frames.append(frame)
        } while(true)
        
        // if we have more than 1 frame create the sprite
        if frames.count > 0 {
            
            // create animation
            var animation = CCAnimation(spriteFrames: frames, delay: 1.0/15.0)
            
            // create sprite
            var sprite = CCSprite(spriteFrame: frames[0])
            
            // set position to center of screen
            sprite.position = CGPointMake(CCDirector.sharedDirector().viewSize().width / 2.0,
                                          CCDirector.sharedDirector().viewSize().height / 2.0)
            
            // run animate action
            sprite.runAction(CCActionRepeatForever(action: CCActionAnimate(animation: animation)))
        
            // add sprite to scene
            scene.addChild(sprite)
        }
        
        // return our scene
        return scene
    }

}

