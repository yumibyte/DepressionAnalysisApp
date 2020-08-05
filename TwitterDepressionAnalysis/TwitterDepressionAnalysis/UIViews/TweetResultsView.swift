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
import ChameleonFramework

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
                                    ZStack {
                                        Rectangle()
                                        .frame(width: 330, height: 250)
                                        .cornerRadius(15)
                                            .foregroundColor(Color(FlatWhite()))
                                        Text(value)
                                        .lineLimit(5)
                                            .frame(width: 293)
                                            .offset(y: -20)
                                            .font(.body)
                                        Text(key)
                                            .offset(x: -80, y: -80)
                                            .font(.title)

                                        
                                    }
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
