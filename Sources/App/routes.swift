import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "Welcome to the Random Image API!"
    }
    
    app.on(.POST, "upload", body: .collect(maxSize: "10mb")) { req in
        return imageController(req)
    }
}
