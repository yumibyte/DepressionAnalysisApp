//
//  TweetResultsView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/27/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI
import TwitterKit
import CoreML
import NaturalLanguage

struct TweetResultsView: View {
    @State var depressedTweets: [String] = []
    @State var tweetArray: [String]?
    @State var tweetIds: [String]?
    
    
    @EnvironmentObject var displayView: DisplayView
    @EnvironmentObject var twitter: TwitterService
//    @State var showTweetActions: Bool?
    let model = LSTM_CNN_Trained()
    let findAPIKey = FindAPIKey()
    
    func readTweets() {
        for tweet in tweetArray! {
            let prediction = SwiftNLCModel().predict(tweet)
            if prediction!.1 > 0.01 {
                depressedTweets.append(tweet)
            }
        }
        print(depressedTweets)

        
    }
    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    Text("hi")
//                    List {
//                        ForEach (self.depressedTweets) { tweet in
//
//                            Text(tweet)
//
//                        }
//                    }
//                    TweetsTableUIViewStruct(twitter: self.twitter)
                    
                    
                }
            }
        }.navigationBarBackButtonHidden(true)
            .onAppear() {
//                if self.displayView.isActiveTweetIds == true {
//                    TweetsTableViewClass(twitter: self.twitter).displayTweets() { tweetView in
//                        self.tweetViewToDisplay = tweetView
//                    }
//                }
                TweetsTableViewClass(twitter: self.twitter).loadTweets() { tweetIds, tweetArray in
                    
                    self.tweetIds = tweetIds
                    self.tweetArray = tweetArray
                    //                    image in
                    //                    self.placeHolderImage = Image(uiImage: image)
                    self.readTweets()
                    self.displayView.isActiveTweetIds = true
                    
                }
        }
    }
}

struct TweetResultsView_Previews: PreviewProvider {
    static var previews: some View {
        TweetResultsView()
    }
}
