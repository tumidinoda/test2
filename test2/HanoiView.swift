//
//  HanoiView.swift
//  test2
//
//  Created by Robert Jonas on 15.06.17.
//  Copyright © 2017 jr-soft. All rights reserved.
//

import Foundation
import SpriteKit

class HanoiView: SKScene {
    //---------------------------------------------------------------------------------------------------------------
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    override init(size: CGSize) {
        super.init(size: size)
        
        
        //draw tower stakes
        let stakeHeight=self.frame.height-100
        let stake1=SKSpriteNode(color: UIColor.blue, size: CGSize(width: 3, height: stakeHeight))
        stake1.position=CGPoint(x: self.frame.width/4, y: self.frame.height/2)
        addChild(stake1)
        let stake2=SKSpriteNode(color: UIColor.blue, size: CGSize(width: 3, height: stakeHeight))
        stake2.position=CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        addChild(stake2)
        let stake3=SKSpriteNode(color: UIColor.blue, size: CGSize(width: 3, height: stakeHeight))
        stake3.position=CGPoint(x: self.frame.width*3/4, y: self.frame.height/2)
        addChild(stake3)
        let bottomLine=SKSpriteNode(color: UIColor.blue, size: CGSize(width: self.frame.width, height: 3))
        bottomLine.position=CGPoint(x: self.frame.width/2, y: 50)
        addChild(bottomLine)
    }
    //---------------------------------------------------------------------------------------------------------------
    
    
    
    
    
    
    
    
    //---------------------------------------------------------------------------------------------------------------
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
    }
}
