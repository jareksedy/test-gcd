//
//  DataQueue.swift
//  test-gcd
//
//  Created by Ярослав on 22.08.2021.
//

import Foundation
import UIKit

struct DataItem: Codable {
    let message: String
    let status: String
}

class DataQueue {
    
    var label: UILabel?
    private var count: Int { self.dataItems.count }
    private var maxCount: Int
    
    init(maxCount: Int) {
        self.maxCount = maxCount
    }
    
    private var dataItems: [DataItem] = [] {
        didSet {
            DispatchQueue.main.async {
                self.label?.text = "Count: \(self.count)"
            }
        }
    }
    
    func dequeue() -> DataItem? {
        return count > 0 ? dataItems.removeFirst() : nil
    }
    
    func fill() {
        DispatchQueue.global(qos: .userInitiated).async {
            while self.dataItems.count < self.maxCount {
                self.dataItems.append(self.fetchData())
            }
        }
    }
    
    private func fetchData() -> DataItem {
        
        var dataItem: DataItem?
        let url = URL(string: "https://dog.ceo/api/breeds/image/random")!
        
        while dataItem == nil {
            do {
                let data = try Data(contentsOf: url)
                do {
                    dataItem = try JSONDecoder().decode(DataItem.self, from: data)
                } catch { print(error) }
            } catch { print(error) }
        }
        
        return dataItem!
    }
}
