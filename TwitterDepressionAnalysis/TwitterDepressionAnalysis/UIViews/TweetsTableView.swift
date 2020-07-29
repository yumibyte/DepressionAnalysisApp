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

class TweetsTableViewClass: TWTRTimelineViewController, TWTRTweetViewDelegate, ObservableObject {
    var twitter: TwitterService
    
    
    init(twitter: TwitterService) {
        
        self.twitter = twitter
                let dataSource = TWTRUserTimelineDataSource(screenName: twitter.credential!.screenName, apiClient: TWTRAPIClient())

  
        super.init(dataSource: dataSource)
        
    }
    
    func loadTweets(completion: @escaping (Result<Array<String>, Error>) -> Void) {
        dataSource.loadPreviousTweets(beforePosition: "0") { (individualTweet, timelineCursor, error) in
            
            // create count for individualTweet and pull description of each where tweet = x
            
            var tweetArray: [String] = []
            var count = 0
            while count < individualTweet!.count {
                for x in individualTweet! {
                    tweetArray.append(x.description)
                    count += 1
                }
            }
            if let error = error {
                completion(.failure(error))
            } else {
                
                completion((.success(tweetArray)))
            }
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    

