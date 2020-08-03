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
//    var tweetArray: [String]
    typealias UIViewControllerType = TweetsTableViewClass

    func makeUIViewController(context: Context) -> TweetsTableViewClass {
        return TweetsTableViewClass(twitter: twitter)
    }

    func updateUIViewController(_ uiViewController: TweetsTableViewClass, context: Context) {
        //placeholder
    }
    
 
}

class TweetsTableViewClass: TWTRTimelineViewController, TWTRTweetViewDelegate {
    var tweetIds: [String] = []
    var tweetsToDisplay: [TWTRTweet] = []
    var twitter: TwitterService

    init(twitter: TwitterService) {
        
        self.twitter = twitter
        let dataSource = TWTRUserTimelineDataSource(screenName: twitter.credential!.screenName, apiClient: TWTRAPIClient())

  
        super.init(dataSource: dataSource)
        
    }
    
    func displayTweets() {
        let client = TWTRAPIClient()
        client.loadTweets(withIDs: tweetIds) { (tweets, error) -> Void in
            if ((tweets) != nil) {
                for i in tweets! {
                    self.tweetsToDisplay.append(i)
                }
            } else {
                print(error as Any)
            }
        }
    }
    
    func loadTweets(completion: @escaping ([String], [String]) -> Void) {

        dataSource.loadPreviousTweets(beforePosition: "0") { (individualTweet, timelineCursor, error) in
            
            // create count for individualTweet and pull description of each where tweet = x
            
            var tweetArray: [String] = []
            var count = 0
            while count < individualTweet!.count {
                for x in individualTweet! {
                    tweetArray.append(x.description)
                    self.tweetIds.append(x.tweetID)
                    count += 1
                }
            }
            completion(tweetArray, self.tweetIds)

        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

