import Vapor
import SwiftImage

func resizeImg(image: Image<UInt8>, width: Int?, height: Int?, preserveAspectRatio: Bool?) -> Image<UInt8> {
    var newImage = image
    let aspectRatio: Double = Double(newImage.width) / Double(newImage.height)
    if let width = width, let height = height {
        newImage = newImage.resizedTo(width: width, height: height)
    }
    else if let width = width {
        if let preserveAspectRatio = preserveAspectRatio {
            if(preserveAspectRatio){
                newImage = newImage.resizedTo(width: width, height: Int(Double(width) * (1.0 / aspectRatio)))
            }
            else {
                newImage = newImage.resizedTo(width: width, height: newImage.height)
            }
        }
        else {
            newImage = newImage.resizedTo(width: width, height: newImage.height)
        }
    } else if let height = height {
        if let preserveAspectRatio = preserveAspectRatio {
            if(preserveAspectRatio){
                newImage = newImage.resizedTo(width: Int(Double(height) * aspectRatio), height: height)
            } else {
                newImage = newImage.resizedTo(width: newImage.width, height: height)
            }
            
        }
        else {
            newImage = newImage.resizedTo(width: newImage.width, height: height)
        }
    }
    return newImage
}

func resizeImg(image: Image<RGBA<UInt8>>, width: Int?, height: Int?, preserveAspectRatio: Bool?) -> Image<RGBA<UInt8>> {
    var newImage = image
    let aspectRatio: Double = Double(newImage.width) / Double(newImage.height)
    if let width = width, let height = height {
        newImage = newImage.resizedTo(width: width, height: height)
    }
    else if let width = width {
        if let preserveAspectRatio = preserveAspectRatio {
            if(preserveAspectRatio){
                newImage = newImage.resizedTo(width: width, height: Int(Double(width) * (1.0 / aspectRatio)))
            }
            else {
                newImage = newImage.resizedTo(width: width, height: newImage.height)
            }
        }
        else {
            newImage = newImage.resizedTo(width: width, height: newImage.height)
        }
    } else if let height = height {
        if let preserveAspectRatio = preserveAspectRatio {
            if(preserveAspectRatio){
                newImage = newImage.resizedTo(width: Int(Double(height) * aspectRatio), height: height)
            } else {
                newImage = newImage.resizedTo(width: newImage.width, height: height)
            }
            
        }
        else {
            newImage = newImage.resizedTo(width: newImage.width, height: height)
        }
    }
    return newImage
}
