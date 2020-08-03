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
    @EnvironmentObject var displayView: DisplayView
    @EnvironmentObject var twitter: TwitterService
//    @State var showTweetActions: Bool?
    let model = LSTM_CNN_Trained()
    let findAPIKey = FindAPIKey()
    
    func readTweets() {
        do {
            let prediction = SwiftNLCModel().predict("Life's horrible. The world is a shithole and I just wanna leave it all behind. I'm so suicidal")
            //I am so sad and don't know what to do with my life anymore. I just want to give up.

            print(prediction!.1)
            
//            let nextInput = try model.prediction(input: result)
//            print(result.text)
        } catch {
            print(error.localizedDescription)
            fatalError()
            
        }
        
//        if let prediction = model.prediction(input: SwiftNLCModel().predict("i am sad")) {
//            print(prediction.0)
//        }
//        else {
//            print("error")
//        }

        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TweetsTableUIViewStruct(twitter: self.twitter)
            }.offset(y: -300)
        }.navigationBarBackButtonHidden(true)
            .onAppear() {
                TweetsTableViewClass(twitter: self.twitter).loadTweets() { tweetArray in
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
