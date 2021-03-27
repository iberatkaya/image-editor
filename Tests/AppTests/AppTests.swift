@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    ///Test resizing an image.
    func testImageResize() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        
        try app.test(.POST, "upload", beforeRequest: { req in
            //Get the image path.
            let imgPath = getImgPath("apple.png")
            
            //Get the data of the file.
            let data = try Data(contentsOf: URL(string: "file:///" + imgPath)!)
            
            //Create the temporary file.
            let myFile = File(data: ByteBuffer(data: data), filename: "file.png")

            //Create the request parameters.
            let content = ImageControllerParams(file: myFile, height: 100, width: 500)

            //Set the content of the request.
            try req.content.encode(content)
        }, afterResponse: { res in
            //Decode the request content.
            let data = try res.content.decode(ImageControllerResponse.self)
            
            //Make sure the status is ok.
            XCTAssertEqual(res.status, .ok)
            
            //Make sure the base64 file content is not null.
            XCTAssertNotNil(data.file)
            
            //Decode the base64 String to Data.
            let dataDecoded = Data(base64Encoded: data.file!, options: .ignoreUnknownCharacters)!
            
            //Set the response file path to write.
            let imgPath = getImgPath("apple_resized.jpg")
            
            //Write the resized file to the directory.
            try dataDecoded.write(to: URL(string: "file:///" + imgPath)!)
        })
    }
    
    ///Test blurring an image.
    func testImageBlur() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        
        try app.test(.POST, "upload", beforeRequest: { req in
            //Get the image path.
            let imgPath = getImgPath("apple.png")
            
            //Get the data of the file.
            let data = try Data(contentsOf: URL(string: "file:///" + imgPath)!)
            
            //Create the temporary file.
            let myFile = File(data: ByteBuffer(data: data), filename: "file.png")

            //Create the request parameters.
            let content = ImageControllerParams(file: myFile, blurRadius: 5)

            //Set the content of the request.
            try req.content.encode(content)
        }, afterResponse: { res in
            //Decode the request content.
            let data = try res.content.decode(ImageControllerResponse.self)
            
            //Make sure the status is ok.
            XCTAssertEqual(res.status, .ok)
            
            //Make sure the base64 file content is not null.
            XCTAssertNotNil(data.file)
            
            //Decode the base64 String to Data.
            let dataDecoded = Data(base64Encoded: data.file!, options: .ignoreUnknownCharacters)!
            
            //Set the response file path to write.
            let imgPath = getImgPath("apple_blur.jpg")
            
            //Write the blurred file to the directory.
            try dataDecoded.write(to: URL(string: "file:///" + imgPath)!)
        })
    }
    
    ///Test making an image grayscale.
    func testImageGrayscale() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        
        try app.test(.POST, "upload", beforeRequest: { req in
            //Get the image path.
            let imgPath = getImgPath("apple.png")
            
            //Get the data of the file.
            let data = try Data(contentsOf: URL(string: "file:///" + imgPath)!)
            
            //Create the temporary file.
            let myFile = File(data: ByteBuffer(data: data), filename: "file.png")

            //Create the request parameters.
            let content = ImageControllerParams(file: myFile, grayscale: true)

            //Set the content of the request.
            try req.content.encode(content)
        }, afterResponse: { res in
            //Decode the request content.
            let data = try res.content.decode(ImageControllerResponse.self)
            
            //Make sure the status is ok.
            XCTAssertEqual(res.status, .ok)
            
            //Make sure the base64 file content is not null.
            XCTAssertNotNil(data.file)
            
            //Decode the base64 String to Data.
            let dataDecoded = Data(base64Encoded: data.file!, options: .ignoreUnknownCharacters)!
            
            //Set the response file path to write.
            let imgPath = getImgPath("apple_gray.jpg")
            
            //Write the grayscale file to the directory.
            try dataDecoded.write(to: URL(string: "file:///" + imgPath)!)
        })
    }

    /// Get an image path in the current directory.
    func getImgPath(_ img: String) -> String {
        var filePathArray: [String] = #file.split(separator: "/").map { String($0) }
        
        filePathArray.removeLast()
        
        filePathArray.append(img)
        
        let imgPath = filePathArray.joined(separator: "/")
        
        return imgPath
    }
}
