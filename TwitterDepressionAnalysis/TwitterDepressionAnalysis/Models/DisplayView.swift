//
//  DisplayView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/27/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import Foundation

class DisplayView: ObservableObject {
    
    @Published var displayViewBool: Bool = true
    @Published var displayTweetsBool: Bool = false
    @Published var tweetArrayText: [String] = []
    @Published var tweetArrayIds: [String] = []
    

}

