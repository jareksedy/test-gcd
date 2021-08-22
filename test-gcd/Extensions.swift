//
//  Extensions.swift
//  test-gcd
//
//  Created by Ярослав on 22.08.2021.
//

import UIKit
import Foundation

extension UIImageView {
    func loadImage(withUrl urlString : String) {
        let url = URL(string: urlString)
        self.image = nil

        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    self.image = image
                }
            }
        }).resume()
    }
}
