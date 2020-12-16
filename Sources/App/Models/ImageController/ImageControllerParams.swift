import Vapor

struct ImageControllerParams: Content {
    var file: File
    var grayscale: Bool?
    var height: Int?
    var width: Int?
    var blurRadius: Int?
    var preserveAspectRatio: Bool?
}
