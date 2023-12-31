import UIKit
import SwiftUI

public extension UIImage {
    var averageColor: UIColor? {
        // Convert the image to a Core Image
        guard let originalImage = CIImage(image: self) else { return nil }

        // Create a frame with the same dimensions as the image
        let vector = CIVector(x: originalImage.extent.origin.x,
                                    y: originalImage.extent.origin.y,
                                    z: originalImage.extent.size.width,
                                    w: originalImage.extent.size.height)

        // Create a CIAreaAverage filter, this will be used to to pull the average color from the image later
        guard let filter = CIFilter(name: "CIAreaAverage",
                                  parameters: [kCIInputImageKey: originalImage, kCIInputExtentKey: vector]) else { return nil }
        guard let finalImage = filter.outputImage else { return nil }
        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull!])

        // Render the final image as a single image to fill the space
        context.render(finalImage,
                       toBitmap: &bitmap,
                       rowBytes: 4,
                       bounds: CGRect(x: 0, y: 0, width: 1, height: 1),
                       format: .RGBA8,
                       colorSpace: nil)

        // Convert the bitmap image into a single color, average of the color of the original image
        return UIColor(red: CGFloat(bitmap[0]) / 255,
                       green: CGFloat(bitmap[1]) / 255,
                       blue: CGFloat(bitmap[2]) / 255,
                       alpha: CGFloat(bitmap[3]) / 255)
    }
    
    func rgb() -> Int? {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if ((self.averageColor?.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha)) != nil) {
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)

            let rgb = (iAlpha << 24) + (iRed << 16) + (iGreen << 8) + iBlue
            return rgb
        }
        else {
            return nil
        }
    }
}
