//
//  TweetsTableView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/27/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI
import TwitterKit
class TweetsTableView: TWTRTimelineViewController, UIViewRepresentable {
    var body: some View {
        VStack {
            Text("")
        }.onAppear() {
            TWTRAPIClient().loadTweet(withID: "20") { tweet, error in
                if let t = tweet {
                    let tweetView = TWTRTweetView(tweet: t)
                    tweetView.center = self.view.center
                    self.view.addSubview(tweetView)
                } else {
                    print("Failed to load Tweet: \(error)")
                }
            }
        }
    }
    
}

//struct TweetsTableView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetsTableView()
//    }
//}
