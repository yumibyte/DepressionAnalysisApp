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
//
//client.loadTweet(withID: <#T##String#>, completion: <#T##TWTRLoadTweetCompletion##TWTRLoadTweetCompletion##(TWTRTweet?, Error?) -> Void#>)
//    }
    }
    var body: some View {
        //
        VStack {
            Text("")
            TweetsTableUIViewStruct()
        }.onAppear {
           //
        }
        

    }
}

struct TweetResultsView_Previews: PreviewProvider {
    static var previews: some View {
        TweetResultsView()
    }
}
