//
//  TweetsTableView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/27/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI
import TwitterKit

struct TweetsTableUIViewStruct: UIViewControllerRepresentable {

    var twitter: TwitterService

    typealias UIViewControllerType = TweetsTableViewClass

    func makeUIViewController(context: Context) -> TweetsTableViewClass {
        return TweetsTableViewClass(twitter: twitter)
    }
    
    func updateUIViewController(_ uiViewController: TweetsTableViewClass, context: Context) {
        //placeholder
    }
    
 
}

class TweetsTableViewClass: TWTRTimelineViewController, TWTRTweetViewDelegate {
    var twitter: TwitterService
    
    init(twitter: TwitterService) {
        
        // Display user timeline
        self.twitter = twitter
        let dataSource = TWTRUserTimelineDataSource(screenName: twitter.credential!.screenName, apiClient: TWTRAPIClient())

//        self.title = "@\(dataSource.screenName)"
        super.init(dataSource: dataSource)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tweetView(tweetView: TWTRTweetView, didSelectTweet tweet: TWTRTweet) {
    // Log a message whenever a user taps on a tweet
    print("Selected tweet with ID: \(tweet.tweetID)")
    }

}

