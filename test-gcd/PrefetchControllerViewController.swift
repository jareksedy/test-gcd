//
//  PrefetchControllerViewController.swift
//  test-gcd
//
//  Created by Ярослав on 22.08.2021.
//

import UIKit

class PrefetchControllerViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    let dataQueue = DataQueue()
    let maxCount = 10
    
    @IBAction func prefetchTap(_ sender: Any) {
        
        displayCount()
        dataQueue.asyncFillUpTo(maxCount)
        guard let temp = dataQueue.dequeue() else { return }
        print("NAME: \(temp.name) AGE: \(temp.age) COUNT: \(temp.count)")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        dataQueue.asyncFillUpTo(maxCount)
        displayCount()
    }
    
    private func displayCount() {
        countLabel.text = "Array count: \(dataQueue.count)"
    }
}
