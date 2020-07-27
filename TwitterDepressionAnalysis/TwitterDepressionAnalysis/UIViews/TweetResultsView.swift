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
    
    func readTweets() {
        TWTRTwitter.sharedInstance().logIn { (session, error) in
            let client = TWTRAPIClient.withCurrentUser()
            self.dataSource = TWTRUserTimelineDataSource(screenName: self.twitter.credential!.screenName, apiClient: client)
            self.showTweetActions = true
        }
    }
    var body: some View {
        //
        TWTRTimelineViewController(dataSource: self.dataSource)
        
    }
}

struct TweetResultsView_Previews: PreviewProvider {
    static var previews: some View {
        TweetResultsView()
    }
}
