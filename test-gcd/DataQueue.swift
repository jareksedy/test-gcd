//
//  DataQueue.swift
//  test-gcd
//
//  Created by Ярослав on 22.08.2021.
//

import Foundation

class DataItem: Codable {
    
    let name: String
    let age: Int
    let count: Int
}

class DataQueue {
    
    private var dataItems: [DataItem?] = []
    
    var count: Int { self.dataItems.count }
    
    func dequeue() -> DataItem? {
        
        return count > 0 ? dataItems.removeFirst() : nil
    }
    
    func asyncFillUpTo(_ count: Int) {
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            while self.dataItems.count < count {
                self.dataItems.append(self.fetchData())
            }
        }
    }
    
    private func fetchData() -> DataItem? {
        
        var dataItem: DataItem?
        
        let url = URL(string: "https://api.agify.io/?name=Yaroslav")
        
        do {
            let data = try Data(contentsOf: url!)
            
            do {
                dataItem = try JSONDecoder().decode(DataItem.self, from: data)
                
            } catch { print(error) }
        } catch { print(error) }
        
        return dataItem
    }
}
