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
        
        self.twitter = twitter
        
        let dataSource = TWTRUserTimelineDataSource(screenName: twitter.credential!.screenName, userID: twitter.credential?.userId, apiClient: TWTRAPIClient(), maxTweetsPerRequest: 20, includeReplies: true, includeRetweets: true)
        super.init(dataSource: dataSource)

        func retrievePosts() {
        
            // Display user timeline
            
            dataSource.loadPreviousTweets(beforePosition: "0") { (individualTweet, timelineCursor, tweets) in
                print("<<<<<<>>>>>>")
                var count = 0
                for x in individualTweet! {
//                    NSLog("tweet text is == %@ \n", [List[count]])
                    print(x.description)
                    
                    
                    count += 1
                }
            }
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
        
//        let test = TWTRListTimelineDataSource(listID: "", apiClient: TWTRAPIClient())
//        print(test)
//        self.title = "@\(dataSource.screenName)"

        
        
        
        
        
        
        
        
        
//        super.init(dataSource: dataSource)
        
    

//
//    func tweetView(tweetView: TWTRTweetView, didSelectTweet tweet: TWTRTweet) {
//    // Log a message whenever a user taps on a tweet
//
//    }



