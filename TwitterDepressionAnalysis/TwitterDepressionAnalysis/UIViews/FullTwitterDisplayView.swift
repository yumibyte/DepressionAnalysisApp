//
//  FullTwitterDisplayView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/27/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI

struct FullTwitterDisplayView: View {
//    @EnvironmentObject var twitter: TwitterService
    @State var displayView: Bool
    // true = open AnalyzeUserView()
    // false = open FullTwitterDisplayView()

    var body: some View {
        NavigationView {
            VStack {
                if displayView == true {
                    AnalyzeUserView(createView: false, displayView: displayView)
                } else {
                    TweetResultsView(displayView: displayView)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct FullTwitterDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        FullTwitterDisplayView(displayView: true)
        
    }
}
