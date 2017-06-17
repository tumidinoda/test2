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
    func gameDidBegin(brain: HanoiSolver)
    
    // Invoked after a new game has begun
    func moveDisk(disk: Int,from: Int,to: Int)
    
    
}
//---------------------------------------------------------------------------------------------------------------
class HanoiSolver{
    var delegate:HanoiSolverDelegate?
    //---------------------------------------------------------------------------------------------------------------
    func solve(disk: Int,from: Int,to: Int){
        if disk>0 {
            let hilfsTurm=abs(from+to-3)
            solve(disk: disk-1, from: from, to: hilfsTurm)
            delegate?.moveDisk(disk: disk, from: from, to: to)
            solve(disk: disk-1, from: hilfsTurm, to: to)
        }
    }
    
    //---------------------------------------------------------------------------------------------------------------
    func start(numberDisks: Int){
        delegate?.gameDidBegin(brain: self)
        solve(disk: numberDisks, from: 0, to: 2)
        
        
    }
}
