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

    @EnvironmentObject var displayView: DisplayView
    @State var tweetIds: [String]?
    @EnvironmentObject var tweetStructure: TweetStructure
    @EnvironmentObject var twitter: TwitterService
    
    func toggleViews() {
        self.displayView.displayHelpViewBool.toggle()
        self.displayView.displayTweetsBool.toggle()
    }
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(displayView.depressedTweet.sorted(by: >), id: \.key) { key, value in
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
                                Text("🙁")
                                    .scaleEffect(1.5)
                                    .offset(x: -130, y: 72)
                                Text("Use the Resources Button for Help")
                                    .offset(x: 20, y: 80)
                                    .scaleEffect(0.9)
                                    .foregroundColor(Color(FlatGrayDark()))
                                Text(key)
                                    .offset(x: -65, y: -80)
                                    .font(.system(size: 25, weight: .heavy, design: .default))

                            }
                    }
                    Button(action: {
                        self.toggleViews()
                        })
                        {
                        Text("Find Resources")
                        
                    }.frame(width: 180, height: 50)
                                .background(Color(FlatSkyBlue()))
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                                .font(.system(size: 16, weight: .medium, design: .default))
                        .offset(x: 70)
                        
                    }
                }

                    
            }

                
            
//            .navigationBarTitle("")
//            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
//            .navigationBarHidden(true)
//            .navigationBarTitle(Text("Depressed Tweets"), displayMode: .inline)
        }

    
}

struct DisplayTweetView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayTweetView()
        .environmentObject(TweetStructure())

    }
}


