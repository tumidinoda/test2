//
//  GameViewController.swift
//  test2
//
//  Created by Robert Jonas on 15.06.17.
//  Copyright © 2017 jr-soft. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
//---------------------------------------------------------------------------------------------------------------
class GameViewController: UIViewController, HanoiSolverDelegate {
    var myTowerView: HanoiView!
    //---------------------------------------------------------------------------------------------------------------
    func gameDidBegin(brain: HanoiSolver) {
        print("Game did begin")
    }
    
    func moveDisk(disk: Int,from: Int,to: Int) {
        print("Disk: \(disk) from: \(from) to: \(to)")
        myTowerView.moveDisk(diskNo: disk, from: from, to: to)
        
    }
    //---------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view.
        let skView = view as! SKView
        skView.isMultipleTouchEnabled = false
        
        // Create and configure the scene.
        myTowerView = HanoiView(size: skView.bounds.size)
        myTowerView.scaleMode = .aspectFill
        
        // Present the scene.
        skView.presentScene(myTowerView)
        
        //start Hanoi and register delegate
        let myHanoiSolver=HanoiSolver()
        myHanoiSolver.delegate=self
        
        
        myTowerView.setTowers(numberDisks: 10)
        //       myTowerView.moveDisk(diskNo: 1, from: 0, to: 2)
        myHanoiSolver.start(numberDisks: 10)
        
        
        
    }
    
    
    
    
    
    
    //---------------------------------------------------------------------------------------------------------------
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
