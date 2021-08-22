//
//  PrefetchControllerViewController.swift
//  test-gcd
//
//  Created by Ярослав on 22.08.2021.
//

import UIKit

class PrefetchControllerViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    private var count = 0
    
    @IBAction func prefetchTap(_ sender: Any) {
        count += 1
        displayCount()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCount()
    }
    
    private func displayCount() {
        countLabel.text = "Array count: \(count)"
    }
}
