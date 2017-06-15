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

class GameViewController: UIViewController {
    var myTowerView: HanoiView!
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
        
        
        
        
    }
    
    
    
    
    
    
    //---------------------------------------------------------------------------------------------------------------
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
