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
    // inform Controler about move
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
        solve(disk: numberDisks, from: 0, to: 2)
        
    }
}
