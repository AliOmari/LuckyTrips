
import Foundation
import ObjectMapper

struct RoomsResponse : Codable {
    let rooms : [Room]
}

struct Room : Codable {
    let roomId : Int
    let name : String
    let roomDescription : String
    let numberOfRoomsLeft : Int
    let maxOccupancy : Int
    let price : Price
    let bedConfigurations : [BedConfiguration]
    let photos : [String]
    
    func getImage()->URL?{
        return URL(string: photos.first ?? "")
    }
    
    func getFormattedBedConfigurations()->String{
        var configs = ""
        for bedConfig in bedConfigurations{
            configs.append(bedConfig.getFormmattedConfig())
            configs.append(",")
        }
        
        configs.removeLast()
        return configs
    }
}

struct Price : Codable {
    let currency : String
    let priceValue : Double

    func getFormattedPrice()->String{
        return "\(priceValue) \(currency)"
    }
}

struct BedConfiguration : Codable {
    let count : Int
    let name : String

    func getFormmattedConfig()->String{
        return name
    }
}
