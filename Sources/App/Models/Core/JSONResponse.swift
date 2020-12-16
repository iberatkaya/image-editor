import Vapor

protocol JSONResponse: Content {
    var status: Bool { get set }
    var code: Int { get set}
}
