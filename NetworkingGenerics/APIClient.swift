//
//  Copyright © 2016 Fish Hook LLC. All rights reserved.
//

import Foundation

typealias ObjectNotation = [ String : AnyObject ]

class APIClient {
    
    let baseURL: NSURL
    
    init(baseURL: NSURL)
    {
        self.baseURL = baseURL
    }
    
    func getFruitsForRegionIdentifier(regionIdentifier: String, seasonIdentifier: Int, successHandler: ((ObjectNotation) -> Void)?, failureHandler: ((NSError) -> Void)?) -> NSURL
    {
        guard let URL = NSURL(string: "/fruits/region/\(regionIdentifier)/season/\(seasonIdentifier)", relativeToURL: baseURL) else {
            fatalError()
        }
        
        // create a URL request, and dispatch
        
        return URL
    }
    
    func getHistoricalTrafficReportForRegionIdentifier(regionIdentifier: String, seasonIdentifier: Int, successHandler: ((ObjectNotation) -> Void)?, failureHandler: ((NSError) -> Void)?) -> NSURL
    {
        guard let URL = NSURL(string: "/traffic/region/\(regionIdentifier)/season/\(seasonIdentifier)", relativeToURL: baseURL) else {
            fatalError()
        }
        
        // create a URL request, and dispatch
        
        return URL
    }
    
    func getWildlifeForRegionIdentifier(regionIdentifier: String, successHandler: ((ObjectNotation) -> Void)?, failureHandler: ((NSError) -> Void)?) -> NSURL
    {
        guard let URL = NSURL(string: "/wildlife/region/\(regionIdentifier)", relativeToURL: baseURL) else {
            fatalError()
        }
        
        // create a URL request, and dispatch
        
        return URL
    }
}
