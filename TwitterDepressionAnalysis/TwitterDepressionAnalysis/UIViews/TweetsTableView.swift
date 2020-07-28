//
//  TweetsTableView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/27/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI
import TwitterKit

struct TweetsTableUIViewStruct: UIViewControllerRepresentable {
    typealias UIViewControllerType = TweetsTableViewClass

    func makeUIViewController(context: Context) -> TweetsTableViewClass {
        return TweetsTableViewClass()
    }
    
    func updateUIViewController(_ uiViewController: TweetsTableViewClass, context: Context) {
        //
    }
    
 
}

class TweetsTableViewClass: TWTRTimelineViewController, TWTRTweetViewDelegate {

  convenience init() {
    // Show a timeline of @jack's Tweets
    let dataSource = TWTRUserTimelineDataSource(screenName: "jack", apiClient: TWTRAPIClient())
    self.init(dataSource: dataSource)

    // Set the title for Nav bar
    self.title = "@\(dataSource.screenName)"
  }

  func tweetView(tweetView: TWTRTweetView, didSelectTweet tweet: TWTRTweet) {
    // Log a message whenever a user taps on a tweet
    print("Selected tweet with ID: \(tweet.tweetID)")
  }

}

//struct TweetsTableView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetsTableView()
//    }
//}

