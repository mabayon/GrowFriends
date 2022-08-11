//
//  ImageViewExtension.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import Kingfisher
import UIKit

extension UIImageView {
    func loadImage(from url: String?) {
        let url = URL(string: url ?? "")
        let processor = RoundCornerImageProcessor(cornerRadius: 20)

        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "no_photo"),
            options: [
                .processor(processor),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        )
    }
}
