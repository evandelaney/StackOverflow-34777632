//
//  Copyright © 2016 Fish Hook LLC. All rights reserved.
//

import Foundation

struct TrafficMapper {
    
    enum Error: ErrorType {
        case InvalidObjectNotation
    }
    
    func traffic(objectNotation: ObjectNotation) throws -> Traffic
    {
        guard let dateString = objectNotation["date"] as? String,
            volume = objectNotation["traffic_score"] as? Int else {
                throw Error.InvalidObjectNotation
        }
        
        let date = NSDate() // transform dateString into NSDate
        
        return Traffic(date: date, volume: volume)
    }
}
