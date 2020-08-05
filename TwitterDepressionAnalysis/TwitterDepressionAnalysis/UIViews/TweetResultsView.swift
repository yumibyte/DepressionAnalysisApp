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
                    VStack {
                        List {
                            
                            ZStack {
                                Rectangle()
                                .frame(width: 330, height: 250)
                                .cornerRadius(15)
                                    .foregroundColor(Color(FlatWhite()))
                                Text("sdfsdf sdf sd fs df sd f sdfkdfjdjkfd jsdkfjdfdjfkdjsfksdjfskdf sdkfjsdkfjsdkfsdjf skdfjksdfjskdfjskdf")
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
                                Text("22:22:22")
                                    .offset(x: -85, y: -80)
                                    .font(.system(size: 25, weight: .heavy, design: .default))
                                

                            }
                            Button(action: { //
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
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
    //            .navigationBarHidden(true)
    //            .navigationBarTitle(Text("Depressed Tweets"), displayMode: .inline)
            }.navigationBarTitle("Depressed Tweets")
            .navigationBarBackButtonHidden(true)

        

    }
}

struct TweetResultsView_Previews: PreviewProvider {
    static var previews: some View {
        TweetResultsView()
        .environmentObject(TweetStructure())
    }
}
