//
//  Copyright © 2016 Fish Hook LLC. All rights reserved.
//

import Foundation

class TrafficDownloader {
    
    init(client: APIClient, mapper: TrafficMapper)
    {
        self.client = client
        self.mapper = mapper
    }
    
    func downloadTraffic(location: Location, season: Season, successHandler: (([ Traffic ]) -> Void)?, failureHandler: ((NSError) -> Void)?)
    {
        client.getHistoricalTrafficReportForRegionIdentifier(location.identifier,
            seasonIdentifier: season.identifier,
            successHandler: { objectNotation in
                if let instances = objectNotation["data"] as? [ ObjectNotation ] {
                    do {
                        let trafficReport = try instances.map(self.mapper.traffic)
                        successHandler?(trafficReport)
                    }
                    catch let error as NSError {
                        failureHandler?(error)
                    }
                }
                else {
                    failureHandler?(NSError(domain: "com.traffic.downloader", code: 1000, userInfo: nil))
                }
            },
            failureHandler: failureHandler)
    }
    
    private let client: APIClient
    private let mapper: TrafficMapper
}
