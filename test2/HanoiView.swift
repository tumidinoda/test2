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
    let towerA=0
    let towerB=1
    let towerC=2
    var towers:[[SKSpriteNode]]=[[]]
    var disk1Width=5
    let diskHeight=10
    //---------------------------------------------------------------------------------------------------------------
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    override init(size: CGSize) {
        super.init(size: size)
        
        disk1Width=Int(self.frame.width-4*5)/4/10
        
        
        
        
        
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
    func setTowers(numberDisks:Int){
        for i in 0...numberDisks-1 {
            //build up tower array
            towers[towerA].append(SKSpriteNode(color: UIColor.blue, size: CGSize(width: disk1Width*(numberDisks-i), height: diskHeight)))
            towers[towerA][i].position=CGPoint(x: self.frame.width/4, y: self.frame.height)
            self.addChild(towers[towerA][i])
            
            //let disk fall onto stake
     //       let delay=SKAction.wait(forDuration: 2)
            let moveDiskDown=SKAction.moveTo(y: CGFloat((50+diskHeight/2)+i*diskHeight), duration: 2)
            let seq=SKAction.sequence([moveDiskDown])
            towers[towerA][i].run(seq)
            
            
            
        }
        
        
        
    }
    //---------------------------------------------------------------------------------------------------------------
    func drawTowers(){
        
        
    }
    //---------------------------------------------------------------------------------------------------------------
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
    }
}
