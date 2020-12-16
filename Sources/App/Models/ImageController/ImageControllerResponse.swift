struct ImageControllerResponse: JSONResponse {    
    init(code: Int, status: Bool, message: String, file: String? = nil) {
        self.file = file
        self.message = message
        self.status = status
        self.code = code
    }
    
    var status: Bool
    var code: Int
    var message: String
    var file: String?
}
