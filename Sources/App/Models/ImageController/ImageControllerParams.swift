import Vapor

struct ImageControllerParams: Content {
    init(file: File, grayscale: Bool? = nil, height: Int? = nil, width: Int? = nil, blurRadius: Int? = nil, preserveAspectRatio: Bool? = nil) {
        self.file = file
        self.grayscale = grayscale
        self.height = height
        self.width = width
        self.blurRadius = blurRadius
        self.preserveAspectRatio = preserveAspectRatio
    }
    
    var file: File
    var grayscale: Bool?
    var height: Int?
    var width: Int?
    var blurRadius: Int?
    var preserveAspectRatio: Bool?
}
