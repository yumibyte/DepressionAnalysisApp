//
//  TweetResultsView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/27/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI
import TwitterKit

struct TweetResultsView: View {
    
    @EnvironmentObject var displayView: DisplayView
    @EnvironmentObject var twitter: TwitterService
    @State var dataSource: TWTRUserTimelineDataSource?
    @State var showTweetActions: Bool?
    @State var view: UIView?
    
    func readTweets() {
        TWTRTwitter.sharedInstance().logIn { (session, error) in
            let client = TWTRAPIClient.withCurrentUser()
            self.dataSource = TWTRUserTimelineDataSource(screenName: self.twitter.credential!.screenName, apiClient: client)
            self.showTweetActions = true
            print(self.dataSource)
        }
    }
    
    func readTweet() {
        TWTRAPIClient().loadTweet(withID: "20") { tweet, error in
          if let t = tweet {
            let tweetView = TWTRTweetView(tweet: t)
            tweetView.center = self.view!.center
            self.view!.addSubview(tweetView)
          } else {
            print("Failed to load Tweet: \(error)")
          }
        }
    }
    var body: some View {
        //
        VStack {
         Text("")
        }.onAppear {
            self.readTweet()
        }
        

    }
}

struct TweetResultsView_Previews: PreviewProvider {
    static var previews: some View {
        TweetResultsView()
    }
}
