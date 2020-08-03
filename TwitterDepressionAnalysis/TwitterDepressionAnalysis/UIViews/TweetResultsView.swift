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

    @State var tweetArray: [String]?
    @State var tweetIds: [String]?
    @EnvironmentObject var displayView: DisplayView
    @EnvironmentObject var twitter: TwitterService
//    @State var showTweetActions: Bool?
    let model = LSTM_CNN_Trained()
    let findAPIKey = FindAPIKey()
    
    func readTweets() {
        var depressedTweets: [String] = []
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
            VStack {
                Rectangle()
                TweetsTableUIViewStruct(twitter: self.twitter)
                
                
            }.offset(y: -300)
        }.navigationBarBackButtonHidden(true)
            .onAppear() {
                TweetsTableViewClass(twitter: self.twitter).loadTweets() { tweetIds, tweetArray in
                    self.tweetIds = tweetIds
                    self.tweetArray = tweetArray
                    //                    image in
                    //                    self.placeHolderImage = Image(uiImage: image)
                    self.readTweets()
                    
                }
                
                
        }
    }
}

struct TweetResultsView_Previews: PreviewProvider {
    static var previews: some View {
        TweetResultsView()
    }
}
