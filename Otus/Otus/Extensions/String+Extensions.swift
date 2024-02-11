//
//  String+Extensions.swift
//  Otus
//
//  Created by Nikita Spekhin on 11.02.2024.
//

import Foundation
import UIKit

extension String {
    var imageFromBase64: UIImage? {
        guard let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}
