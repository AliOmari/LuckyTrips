
import Foundation
import Moya

struct APIClient {

    static var baseHeaders: [String: String] {
        return [
          "Content-Type": "application/json"
        ]
    }
    
    struct Url {
        static let baseUrl = URL(string: "https://devapi.luckytrip.co.uk/test")!
    }
    
    enum Path : String {
        case searchRooms = "/rooms"
    }
}

public extension TargetType {
    var baseURL: URL {
        return APIClient.Url.baseUrl
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return APIClient.baseHeaders
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}

class BaseService<Target: TargetType> {
    
    var snakeCaseDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    let provider = MoyaProvider<Target>(plugins: [NetworkLoggerPlugin()])
}
