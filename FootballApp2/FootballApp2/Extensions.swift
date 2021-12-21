//
//  Extensions.swift
//  FootballApp2
//
//  Created by gal linial on 07/12/2021.
//

import UIKit


extension String {

    func downloadImage(to imageView:UIImageView) {
        guard let url = URL(string: self) else {return}
        DispatchQueue.global(qos: .userInteractive).async {
            guard let data = try? Data(contentsOf: url) else {return}
            guard let image = UIImage(data: data) else {return}
            DispatchQueue.main.async {
                imageView.image = image
            }
        }
    }
}

extension UIButton {
    func toCardBackgroundLeague(){
        self.clipsToBounds = true
        self.layer.cornerRadius = 25.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2.0
        
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.6).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 1
        self.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 0.3)
    }
}
