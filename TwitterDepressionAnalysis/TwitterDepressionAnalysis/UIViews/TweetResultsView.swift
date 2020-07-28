//
//  TweetResultsView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/27/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI
import TwitterKit
import Swifter

struct TweetResultsView: View {
    
    
    @EnvironmentObject var displayView: DisplayView
    @EnvironmentObject var twitter: TwitterService
    @State var dataSource: TWTRUserTimelineDataSource?
    @State var showTweetActions: Bool?
    
    let findAPIKey = FindAPIKey()
    func readTweets(tweetView: TWTRTweetView, didSelectTweet tweet: TWTRTweet) {
    // Log a message whenever a user taps on a tweet
    print("Selected tweet with ID: \(tweet.tweetID)")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TweetsTableUIViewStruct(twitter: twitter)
            }.offset(y: -300)
        }.navigationBarBackButtonHidden(true)
            .onAppear() {
//                let x = "test"
//                let test = TWTRListTimelineDataSource(listID: x, apiClient: TWTRAPIClient())
//                print("<<<<>>>>")
                
//                print(self.dataSource.hashValue)
//                print("<<<<<<<<<<<DESC>>>>>>>>>>>")
//
//                print(self.dataSource?.userID)

        }
        
    }
}

struct TweetResultsView_Previews: PreviewProvider {
    static var previews: some View {
        TweetResultsView()
//        .environmentObject(TwitterService())
//        .environmentObject(DisplayView())
    }
}
