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

    }
    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                TweetsTableUIViewStruct(twitter: twitter)
            }.offset(y: -200)
        }.navigationBarBackButtonHidden(true)
        
    }
}

struct TweetResultsView_Previews: PreviewProvider {
    static var previews: some View {
        TweetResultsView()
//        .environmentObject(TwitterService())
//        .environmentObject(DisplayView())
    }
}
