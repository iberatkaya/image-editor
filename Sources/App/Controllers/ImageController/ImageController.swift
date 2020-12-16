import Vapor
import SwiftGD

func imageController(_ req: Request) -> ImageControllerResponse {
    var params: ImageControllerParams
    do {
        params = try req.content.decode(ImageControllerParams.self)
    } catch {
        return ImageControllerResponse(code: 500, status: false, message: "Error parsing parameters! " + error.localizedDescription)
    }
    
    guard var image = try? Image(data: Data(buffer: params.file.data)) else {
        return ImageControllerResponse(code: 500, status: false, message: "Error parsing file!")
    }

    if let grayscale = params.grayscale {
        if(grayscale){
            image.desaturate()
            image = resizeImg(image: image, width: params.width, height: params.height, preserveAspectRatio: params.preserveAspectRatio)
            guard let jpegData = try? image.export(as: .jpg(quality: 90)) else {
                return ImageControllerResponse(code: 500, status: false, message: "Error exporting to jpeg!")
            }
            return ImageControllerResponse(code: 200, status: true, message: "Success!", file: jpegData.base64EncodedString())
        }
    }
    
    image = resizeImg(image: image, width: params.width, height: params.height, preserveAspectRatio: params.preserveAspectRatio)
    guard let jpegData = try? image.export(as: .jpg(quality: 90)) else {
        return ImageControllerResponse(code: 500, status: false, message: "Error exporting to jpeg!")
    }
    return ImageControllerResponse(code: 200, status: true, message: "Success!", file: jpegData.base64EncodedString())
}
