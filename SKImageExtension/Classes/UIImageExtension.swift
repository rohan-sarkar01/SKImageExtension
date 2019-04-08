//
//  UIImageExtension.swift
//  SKImageExtension
//
//  Created by Abhishek Chakraborty on 07/04/19.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    public func circleImageView(borderColor: UIColor, borderWidth: CGFloat){
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = self.layer.frame.size.width / 2
        self.clipsToBounds = true
    }
    
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    public func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
    
    public func downloadAndCacheImage(link: String, contentMode mode: UIViewContentMode = .scaleAspectFill)
    {
        self.kf.indicatorType = .activity
        let picUrl = URL(string: link.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        self.kf.setImage(with: picUrl)
    }
}
