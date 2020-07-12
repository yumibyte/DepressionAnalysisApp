//
//  TwitterService.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/12/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI
import Combine

struct TwitterService {
    
    func valueForAPIKey(named keyname:String) -> String {
      // Credit to the original source for this technique at
      // http://blog.lazerwalker.com/blog/2014/05/14/handling-private-api-keys-in-open-source-ios-apps
        let filePath = Bundle.main.path(forResource: "Keys", ofType: "plist")
        let plist = NSDictionary(contentsOfFile:filePath!)
        let value = plist?.object(forKey: keyname) as! String
        return value
    }
    
    lazy var TWITTER_CONSUMER_KEY = valueForAPIKey(named: "TWITTER_CONSUMER_KEY")
    lazy var TWITTER_CONSUMER_SECRET = valueForAPIKey(named: "TWITTER_CONSUMER_SECRET")
    let TWITTER_URL_SCHEME = "twittersdk"

}
