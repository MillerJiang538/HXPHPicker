//
//  Core+CALayer.swift
//  HXPHPicker
//
//  Created by Slience on 2021/7/14.
//

import UIKit

extension CALayer {
    func convertedToImage(
        size: CGSize = .zero,
        scale: CGFloat = UIScreen.main.scale
    ) -> UIImage? {
        var toSize: CGSize
        if size.equalTo(.zero) {
            toSize = frame.size
        }else {
            toSize = size
        }
//        UIGraphicsBeginImageContextWithOptions(toSize, false, scale)
//        guard let context = UIGraphicsGetCurrentContext() else {
//            return nil
//        }
//        render(in: context)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
        let format = UIGraphicsImageRendererFormat()
        format.opaque = false
        format.scale = scale
        let render = UIGraphicsImageRenderer(size: toSize, format: format)
        let image = render.image { context in
            self.render(in: context.cgContext)
        }
        return image
    }
}
