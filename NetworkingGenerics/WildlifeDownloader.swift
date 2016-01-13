//
//  Copyright © 2016 Fish Hook LLC. All rights reserved.
//

import Foundation

class WildlifeDownloader {
    
    init(client: APIClient, mapper: WildlifeMapper)
    {
        self.client = client
        self.mapper = mapper
    }
    
    func downloadWildlife(location: Location, successHandler: (([ Wildlife ]) -> Void)?, failureHandler: ((NSError) -> Void)?)
    {
        client.getWildlifeForRegionIdentifier(location.identifier,
            successHandler: { objectNotation in
                if let instances = objectNotation["content"] as? [ ObjectNotation ] {
                    do {
                        let wildlife = try instances.map(self.mapper.wildlife)
                        successHandler?(wildlife)
                    }
                    catch let error as NSError {
                        failureHandler?(error)
                    }
                }
                else {
                    failureHandler?(NSError(domain: "com.wildlife.downloader", code: 1000, userInfo: nil))
                }
            },
            failureHandler: failureHandler)
    }
    
    private let client: APIClient
    private let mapper: WildlifeMapper
}
