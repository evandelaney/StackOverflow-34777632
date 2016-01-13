//
//  Copyright © 2016 Fish Hook LLC. All rights reserved.
//

import Foundation

class FruitDownloader {
    
    init(client: APIClient, mapper: FruitMapper)
    {
        self.client = client
        self.mapper = mapper
    }
    
    func downloadFruit(location: Location, season: Season, successHandler: (([ Fruit ]) -> Void)?, failureHandler: ((NSError) -> Void)?)
    {
        client.getFruitsForRegionIdentifier(location.identifier,
            seasonIdentifier: season.identifier,
            successHandler: { objectNotation in
                if let instances = objectNotation["fruit_data"] as? [ ObjectNotation ] {
                    do {
                        let fruits = try instances.map(self.mapper.fruit)
                        successHandler?(fruits)
                    }
                    catch let error as NSError {
                        failureHandler?(error)
                    }
                }
                else {
                    failureHandler?(NSError(domain: "com.fruit.downloader", code: 1000, userInfo: nil))
                }
            },
            failureHandler: failureHandler)
    }
    
    private let client: APIClient
    private let mapper: FruitMapper
}
