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
    let myHanoiSolver=HanoiSolver()
    //---------------------------------------------------------------------------------------------------------------
    func gameDidBegin(brain: HanoiSolver) {
        print("Game did begin")
    }
    
    func moveDisk(disk: Int,from: Int,to: Int) {
        // print("Disk: \(disk) from: \(from) to: \(to)")
        myTowerView.moveDisk(diskNo: disk, from: from, to: to)
        
    }
    //---------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        //register delegates
        myHanoiSolver.delegate=self
        
    }
    
    //---------------------------------------------------------------------------------------------------------------
    @IBAction func startHanoi(_ sender: UIButton) {
        
        // Configure the view.
        let skView = view as! SKView
        skView.isMultipleTouchEnabled = false
        
        // Create and configure the scene.
        myTowerView = HanoiView(size: skView.bounds.size)
        myTowerView.scaleMode = .aspectFill
        
        // Present the scene.
        skView.presentScene(myTowerView)
        
        let number=Int((sender.titleLabel?.text)!)!
        myTowerView.setTowers(numberDisks: number)
        myHanoiSolver.start(numberDisks: number)
        
    }
    
    //---------------------------------------------------------------------------------------------------------------
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
