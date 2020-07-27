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
    
    // true = open AnalyzeUserView()
    // false = open FullTwitterDisplayView()
    @State var displayView: Bool = true

    var body: some View {
        NavigationView {
            VStack {
                if displayView == true {
                    AnalyzeUserView(createView: false)
                } else {
                    TweetResultsView()
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
