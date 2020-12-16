import Vapor
import SwiftGD

///Resizes an image
func resizeImg(image: Image, width: Int?, height: Int?, preserveAspectRatio: Bool?) -> Image {
    var newImage = image
    let aspectRatio: Double = Double(newImage.size.width) / Double(newImage.size.height)
    if let width = width, let height = height {
        newImage = newImage.resizedTo(width: width, height: height)!
    }
    else if let width = width {
        if let preserveAspectRatio = preserveAspectRatio {
            if(preserveAspectRatio){
                newImage = newImage.resizedTo(width: width, height: Int(Double(width) * (1.0 / aspectRatio)))!
            }
            else {
                newImage = newImage.resizedTo(width: width, height: newImage.size.height)!
            }
        }
        else {
            newImage = newImage.resizedTo(width: width, height: newImage.size.height)!
        }
    } else if let height = height {
        if let preserveAspectRatio = preserveAspectRatio {
            if(preserveAspectRatio){
                newImage = newImage.resizedTo(width: Int(Double(height) * aspectRatio), height: height)!
            } else {
                newImage = newImage.resizedTo(width: newImage.size.width, height: height)!
            }
            
        }
        else {
            newImage = newImage.resizedTo(width: newImage.size.width, height: height)!
        }
    }
    return newImage
}
