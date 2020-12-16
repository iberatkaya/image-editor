import Vapor
import SwiftGD

func imageController(_ req: Request) -> ImageControllerResponse {
    var params: ImageControllerParams
    ///Parse the parameters
    do {
        params = try req.content.decode(ImageControllerParams.self)
    } catch {
        return ImageControllerResponse(code: 500, status: false, message: "Error parsing parameters! " + error.localizedDescription)
    }
    
    ///Check if the height is in boundaries
    if let height = params.height {
        if height > 2000 {
            return ImageControllerResponse(code: 422, status: false, message: "Height \(height) is larger than 2000!")
        }
    }
    
    ///Check if the width is in boundaries
    if let width = params.width {
        if width > 2000 {
            return ImageControllerResponse(code: 422, status: false, message: "Width \(width) is larger than 2000!")
        }
    }
    
    ///Try to parse the image
    guard var image = try? Image(data: Data(buffer: params.file.data)) else {
        return ImageControllerResponse(code: 500, status: false, message: "Error parsing file!")
    }

    ///Convert to grayscale
    if let grayscale = params.grayscale {
        if(grayscale){
            image.desaturate()
        }
    }
    
    ///Convert to grayscale
    if let blurRadius = params.blurRadius {
        if(blurRadius != 0){
            image.blur(radius: blurRadius)
        }
    }
    
    ///Resize the image
    image = resizeImg(image: image, width: params.width, height: params.height, preserveAspectRatio: params.preserveAspectRatio)
    
    ///Export the image as jpg
    guard let jpegData = try? image.export(as: .jpg(quality: 90)) else {
        return ImageControllerResponse(code: 500, status: false, message: "Error exporting to jpeg!")
    }
    
    ///Return a success response with the base64 encoded image
    return ImageControllerResponse(code: 200, status: true, message: "Success!", file: jpegData.base64EncodedString())
}
