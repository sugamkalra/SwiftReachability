//
//  Reachability.swift
//  SwiftyReachability
//
//  Created by Sugam Kalra on 08/12/15.
//  Copyright © 2015 Sugam Kalra. All rights reserved.
//

import SystemConfiguration

/**
* Reachability
* Class for checking network
*
* @author Sugam
* @version 1.0
*/
public class Reachability {
    
    /**
     Checking if the device is connected to a network
     */
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
}