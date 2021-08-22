//
//  PrefetchControllerViewController.swift
//  test-gcd
//
//  Created by Ярослав on 22.08.2021.
//

import UIKit

class PrefetchControllerViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var dogImage: UIImageView!
    
    let dataQueue = DataQueue()
    let maxCount = 50
    
    @IBAction func prefetchTap(_ sender: Any) {

        dataQueue.asyncFillUpTo(maxCount)
        guard let temp = dataQueue.dequeue() else { return }
        print("\(temp.message) \(temp.status)")
        if temp.status == "success" {
            dogImage.loadImageUsingCache(withUrl: temp.message)
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        dogImage.loadImageUsingCache(withUrl: "https://images.dog.ceo/breeds/puggle/IMG_074816.jpg")
        
        dataQueue.label = countLabel
        dataQueue.asyncFillUpTo(maxCount)
    }
}
