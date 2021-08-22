//
//  DataQueue.swift
//  test-gcd
//
//  Created by Ярослав on 22.08.2021.
//

import Foundation

class DataQueue {
    
    private var dataItems: [Int] = []
    
    var count: Int {
        
        return self.dataItems.count
    }
    
    func dequeue() -> Int? {
        
        return count > 0 ? dataItems.removeFirst() : nil
    }
    
    func asyncFillUpTo(_ count: Int) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            while self.dataItems.count < count {
                
                self.dataItems.append(Int.random(in: 0...10))
            }
        }
    }
}
