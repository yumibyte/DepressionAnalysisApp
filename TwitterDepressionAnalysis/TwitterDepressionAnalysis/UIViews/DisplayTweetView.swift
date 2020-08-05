//
//  DisplayTweetView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 8/3/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI
import ChameleonFramework

struct DisplayTweetView: View {
    
    @EnvironmentObject var tweetStructure: TweetStructure
    
    var body: some View {
        ZStack {
            Rectangle()
            .frame(width: 330, height: 250)
            .cornerRadius(15)
                .foregroundColor(Color(FlatWhite()))
            Text("sdfjsdkfd sjdfksdjfk skdfjsdkfj skdfjksdf sjdfkdsjfkd sjdkfjsdf")
            .lineLimit(5)
                .frame(width: 293)
                .offset(y: -20)
                .font(.body)
            Text("22:22:22")
                .offset(x: -80, y: -80)
                .font(.title)

            
        }
        
    }
}

struct DisplayTweetView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayTweetView()
        .environmentObject(TweetStructure())

    }
}
