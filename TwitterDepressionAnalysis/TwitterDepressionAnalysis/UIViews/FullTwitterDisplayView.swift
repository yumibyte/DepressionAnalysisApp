//
//  FullTwitterDisplayView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/27/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI
import ChameleonFramework

struct FullTwitterDisplayView: View {
    @EnvironmentObject var displayView: DisplayView
    @State var tweetIds: [String]?
    @EnvironmentObject var tweetStructure: TweetStructure
    @EnvironmentObject var twitter: TwitterService
    
    func readTweets() -> [String:String] {
        var depressedTweets: [String:String] = [:]
        
        var finalArrayText: [String] = []
        var finalArrayIds: [String] = []
        for x in 0..<displayView.tweetArrayText.count {
            let prediction = SwiftNLCModel().predict(displayView.tweetArrayText[x])
            if prediction!.1 > 0.01 {
                finalArrayText.append(displayView.tweetArrayText[x])
                finalArrayIds.append(displayView.tweetArrayIds[x])
            }
        }
        for i in 0..<displayView.tweetArrayText.count {
            finalArrayText.append(displayView.tweetArrayText[i])
            finalArrayIds.append(displayView.tweetArrayIds[i])
            
        }
        
        // create dictionary for TweetStructure
        for (index, element) in finalArrayText.enumerated() {
            depressedTweets[element] = finalArrayIds[index]
        }
        displayView.displayTweetsBool = true
        return depressedTweets
    }
    
    var body: some View {
        
        NavigationView {
            VStack() {
                if displayView.displayViewBool == true {
                    AnalyzeUserView(createView: false)
                        .navigationBarTitle("Current User", displayMode: .automatic)

                } else if displayView.displayTweetsBool == true && displayView.displayViewBool == false {
                    
                    DisplayTweetView()
                    .navigationBarTitle("Depressed Tweets", displayMode: .automatic)
                } else if displayView.displayHelpViewBool == true {
                    HelpView()
                        .navigationBarTitle("Resources", displayMode: .automatic)
                }
                
                
            }


            
            .onAppear() {
                TweetsTableViewClass(twitter: self.twitter).loadTweets() { tweetIds, tweetArray in
                    
                    self.displayView.tweetArrayText.append(contentsOf: tweetArray)
                    self.displayView.tweetArrayIds.append(contentsOf: tweetIds)
                    
                    self.displayView.depressedTweet = self.readTweets()
                }
            }

        }
        .navigationBarBackButtonHidden(true)
        .offset(y: -0.2)
    }
}

struct FullTwitterDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        FullTwitterDisplayView()
        .environmentObject(DisplayView())
        .environmentObject(TweetStructure())
            
    }
}

