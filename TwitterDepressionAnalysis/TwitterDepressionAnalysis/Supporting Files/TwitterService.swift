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

    let TWITTER_CONSUMER_KEY = FindAPIKey().valueForAPIKey(named: "TWITTER_CONSUMER_KEY")
    let TWITTER_CONSUMER_SECRET = FindAPIKey().valueForAPIKey(named: "TWITTER_CONSUMER_SECRET")
    let TWITTER_URL_SCHEME = "twittersdk"

}
extension Notification.Name {
    static let twitterCallback = Notification.Name(rawValue: "Twitter.CallbackNotification.Name")
}
