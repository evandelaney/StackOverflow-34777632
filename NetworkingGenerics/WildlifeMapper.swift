//
//  Copyright © 2016 Fish Hook LLC. All rights reserved.
//

struct WildlifeMapper {
    
    enum Error: ErrorType {
        case InvalidObjectNotation
    }
    
    func wildlife(objectNotation: ObjectNotation) throws -> Wildlife
    {
        guard let name = objectNotation["animal_name"] as? String else {
            throw Error.InvalidObjectNotation
        }
        
        return Wildlife(name: name)
    }
}
