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
    
    @State var tweetArray: [String]?
    @EnvironmentObject var displayView: DisplayView
    @EnvironmentObject var twitter: TwitterService
    @EnvironmentObject var tweets: TweetsTableViewClass
//    @State var tweetTableViewClass = TweetsTableViewClass(twitter: TwitterService())
    @State var showTweetActions: Bool?
    
    let findAPIKey = FindAPIKey()
    
    func readTweets() {
        print(tweetArray)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TweetsTableUIViewStruct(twitter: twitter)
            }.offset(y: -300)
        }.navigationBarBackButtonHidden(true)
            .onAppear() {
                self.tweets.loadTweets() { result in
                    switch result {
                    case .success(let tweetArray):
                        self.tweetArray = tweetArray
                        print("grabbed URL")

                        case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
        }
    }
}

struct TweetResultsView_Previews: PreviewProvider {
    static var previews: some View {
        TweetResultsView()
//        .environmentObject(TweetsTableViewClass)
    }
}
