//
//  HanoiSolver.swift
//  test2
//
//  Created by Robert Jonas on 15.06.17.
//  Copyright © 2017 jr-soft. All rights reserved.
//

import Foundation
//---------------------------------------------------------------------------------------------------------------
protocol HanoiSolverDelegate {
    // Invoked when the current round of Swiftris ends
    func gameDidEnd(brain: HanoiSolver)
    
    // Invoked after a new game has begun
    func gameDidBegin(brain: HanoiSolver)
    
 
}
//---------------------------------------------------------------------------------------------------------------
class HanoiSolver{
    var delegate:HanoiSolverDelegate?
    
    
    func start(){
        delegate?.gameDidBegin(brain: self)
        
        
    }
    
    
    
    
    
    
}
