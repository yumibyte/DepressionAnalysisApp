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
    @State var tweetIds: [String]?
    
    @EnvironmentObject var tweetStructure: TweetStructure
    @EnvironmentObject var displayView: DisplayView
    @EnvironmentObject var twitter: TwitterService
//    @State var showTweetActions: Bool?
    let model = LSTM_CNN_Trained()
    let findAPIKey = FindAPIKey()

    var body: some View {
        NavigationView {
            if displayView.displayTweetsBool == true {
                HStack {
                    VStack {
                       List {
                            ForEach(tweetStructure.depressedTweet.sorted(by: >), id: \.key) { key, value in
                                Section(header: Text(key)) {
                                    Text(value)
                                }
                            }
                        }
                        
                    }
                }
            }
            
        }.navigationBarBackButtonHidden(true)
            .onAppear() {
                print(TweetStructure().depressedTweet)
        }
    }
}

struct TweetResultsView_Previews: PreviewProvider {
    static var previews: some View {
        TweetResultsView()
        .environmentObject(TweetStructure())
    }
}
