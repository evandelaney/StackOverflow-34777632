//
//  Copyright © 2016 Fish Hook LLC. All rights reserved.
//

struct FruitMapper {
    
    enum Error: ErrorType {
        case InvalidObjectNotation
    }
    
    func fruit(objectNotation: ObjectNotation) throws -> Fruit
    {
        guard let name = objectNotation["fruit_name"] as? String,
            description = objectNotation["info"] as? String,
            identifier = objectNotation["id"] as? String else {
                throw Error.InvalidObjectNotation
        }
        
        return Fruit(name: name, description: description, identifier: identifier)
    }
}
