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
    @Binding var displayView: DisplayView
    // true = open AnalyzeUserView()
    // false = open FullTwitterDisplayView()

    var body: some View {
        NavigationView {
            VStack {
                if displayView.displayViewBool == true {
                    AnalyzeUserView(createView: false, displayView: self.displayView.displayViewBool)
                } else {
                    TweetResultsView(displayView: false)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct FullTwitterDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        FullTwitterDisplayView()
        
    }
}
