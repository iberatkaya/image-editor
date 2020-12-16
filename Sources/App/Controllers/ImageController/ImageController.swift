import Vapor
import SwiftImage

func imageController(_ req: Request) -> ImageControllerResponse {
    var params: ImageControllerParams
    do {
        params = try req.content.decode(ImageControllerParams.self)
    } catch {
        return ImageControllerResponse(code: 422, status: false, message: "Error parsing parameters! " + error.localizedDescription)
    }
    
    guard var image = Image<RGBA<UInt8>>(data: Data(buffer: params.file.data)) else {
        return ImageControllerResponse(code: 422, status: false, message: "Error parsing file!")
    }

    if let grayscale = params.grayscale {
        if(grayscale){
            var grayImage = image.map({ $0.gray })
            grayImage = resizeImg(image: grayImage, width: params.width, height: params.height, preserveAspectRatio: params.preserveAspectRatio)
            return ImageControllerResponse(code: 200, status: true, message: "Success!", file: grayImage.jpegData(compressionQuality: 0.9)?.base64EncodedString())
        }
    }
    
    image = resizeImg(image: image, width: params.width, height: params.height, preserveAspectRatio: params.preserveAspectRatio)
    return ImageControllerResponse(code: 200, status: true, message: "Success!", file: image.jpegData(compressionQuality: 0.9)?.base64EncodedString())
}
