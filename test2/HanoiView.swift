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
    
    var disks:[SKSpriteNode]=[]
    var towerHeight=[0,0,0]
    
    var towerPos=[CGFloat(0),CGFloat(0),CGFloat(0)]
    
    var disk1Width=5
    var diskHeight=10
    let bottomHeight=100
    
    var delayTicTime=1.0
    var spriteDelayTime=0.0
    
    //---------------------------------------------------------------------------------------------------------------
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    override init(size: CGSize) {
        super.init(size: size)
        
        disk1Width=Int(self.frame.width-4*5)/4/10
        diskHeight=Int(self.frame.height-100)/2/10
        
        let hilf=CGFloat((self.frame.width-4*10)/6)
        towerPos[towerA]=10+hilf
        towerPos[towerB]=20+3*hilf
        towerPos[towerC]=30+5*hilf
        
        //draw tower stakes
        let stakeHeight=Int(self.frame.height)-2*bottomHeight
        let stake1=SKSpriteNode(color: UIColor.blue, size: CGSize(width: 3, height: stakeHeight))
        stake1.position=CGPoint(x: towerPos[towerA], y: self.frame.height/2)
        addChild(stake1)
        let stake2=SKSpriteNode(color: UIColor.blue, size: CGSize(width: 3, height: stakeHeight))
        stake2.position=CGPoint(x: towerPos[towerB], y: self.frame.height/2)
        addChild(stake2)
        let stake3=SKSpriteNode(color: UIColor.blue, size: CGSize(width: 3, height: stakeHeight))
        stake3.position=CGPoint(x: towerPos[towerC], y: self.frame.height/2)
        addChild(stake3)
        let bottomLine=SKSpriteNode(color: UIColor.blue, size: CGSize(width: self.frame.width, height: 3))
        bottomLine.position=CGPoint(x: self.frame.width/2, y: CGFloat(bottomHeight))
        addChild(bottomLine)
    }
    //---------------------------------------------------------------------------------------------------------------
    func setTowers(numberDisks:Int){
        
        delayTicTime=delayTicTime/Double(numberDisks)
        for i in 0 ... numberDisks-1 {
            //build up tower array
            disks.append(SKSpriteNode(color: UIColor.blue, size: CGSize(width: disk1Width*(i+1), height: diskHeight)))
            disks[i].position=CGPoint(x: towerPos[towerA], y: self.frame.height)
            self.addChild(disks[i])
            
            //let disk fall onto stake
            let delay=SKAction.wait(forDuration: Double(spriteDelayTime))
            let moveDiskDown=SKAction.moveTo(y: CGFloat((bottomHeight-diskHeight/2)+(numberDisks-i)*diskHeight), duration: delayTicTime)
            let seq=SKAction.sequence([delay,moveDiskDown])
            self.disks[i].run(seq)
            spriteDelayTime=spriteDelayTime+delayTicTime
            towerHeight[towerA]+=1
        }
    }
    
    //---------------------------------------------------------------------------------------------------------------
    func moveDisk(diskNo: Int,from: Int,to: Int){
        
        let delay=SKAction.wait(forDuration: Double(spriteDelayTime))
        let moveDiskUp=SKAction.moveTo(y: self.frame.height-50, duration: delayTicTime*3)
        towerHeight[from]-=1
        let moveDiskHor=SKAction.moveTo(x: towerPos[to], duration: delayTicTime)
        let moveDiskDown=SKAction.moveTo(y: CGFloat(bottomHeight+diskHeight/2+towerHeight[to]*diskHeight), duration: delayTicTime/3)
        towerHeight[to]+=1
        
        let seq=SKAction.sequence([delay,moveDiskUp,moveDiskHor,moveDiskDown])
        disks[diskNo-1].run(seq)
        spriteDelayTime=spriteDelayTime+(delayTicTime*3+delayTicTime+delayTicTime/3)
    }
    //---------------------------------------------------------------------------------------------------------------
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
    }
}
