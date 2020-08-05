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
    
    func loadTweets(completion: @escaping ([String], [String]) -> Void) {

        dataSource.loadPreviousTweets(beforePosition: "0") { (individualTweet, timelineCursor, error) in
            
            // create count for individualTweet and pull description of each where tweet = x
            
            var tweetArray: [String] = []
            var count = 0
            
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
            let inString = formatter.string(from: Date())
            let date = formatter.date(from: inString)
            formatter.dateFormat = "MM-dd-yyyy"
//
            while count < individualTweet!.count {
                for x in individualTweet! {
                    tweetArray.append(x.description)
//                    let tweetID = formatter.string(from: x.createdAt)
                    let tweetID = formatter.string(from: x.createdAt)
                    self.tweetIds.append(tweetID)
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


