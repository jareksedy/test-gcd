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
    
    @IBAction func prefetchTap(_ sender: Any) {
        
        displayCount()
        dataQueue.asyncFillUpTo(10)
        _ = dataQueue.dequeue()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        dataQueue.asyncFillUpTo(10)
        displayCount()
    }
    
    private func displayCount() {
        countLabel.text = "Array count: \(dataQueue.count)"
    }
}
