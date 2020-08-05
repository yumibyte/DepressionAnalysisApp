//
//  DisplayTweetView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 8/3/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI


struct DisplayTweetView: View {
    
    @EnvironmentObject var tweetStructure: TweetStructure
    
    var body: some View {
        Rectangle()
        .frame(width: 300, height: 250)
        .cornerRadius(15)
        .
    }
}

struct DisplayTweetView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayTweetView()
        .environmentObject(TweetStructure())

    }
}
