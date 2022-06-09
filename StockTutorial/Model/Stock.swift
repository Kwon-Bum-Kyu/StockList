import Foundation

struct StockResult: Decodable {
    //    {
    //        "1. symbol": "DEMO",
    //        "2. name": "Democrasoft Holdings Inc",
    //        "3. type": "Equity",
    //        "4. region": "United States",
    //        "5. marketOpen": "09:30",
    //        "6. marketClose": "16:00",
    //        "7. timezone": "UTC-04",
    //        "8. currency": "USD",
    //        "9. matchScore": "1.0000"
    //    },
    var items : [Stock]
    enum CodingKeys : String, CodingKey {
        case items = "bestMatches"
        
    }
    
    
}
struct Stock:Decodable {
    var symbol : String?
    var name : String?
    var type : String?
    //    var region : String?
    //    var marketOpen : String?
    //    var marketClose : String?
    //    var timezone : String?
    var currency : String?
    enum CodingKeys : String, CodingKey {
        case symbol = "1. symbol"
        case name = "2. name"
        case type = "3. type"
//        case region = "4. region"
//        case marketOpen = "5. marketOpen"
//        case marketClose = "6. marketClose"
//        case timezone = "7. timezone"
        case currency = "8. currency"
//        case matchScore = "9. matchScore"
        
    }
    
    
}
