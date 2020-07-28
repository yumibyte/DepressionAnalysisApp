//
//  FullTwitterDisplayView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/27/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI

struct FullTwitterDisplayView: View {
    @EnvironmentObject var displayView: DisplayView

    
    var body: some View {
        
        NavigationView {
            VStack {
                if displayView.displayViewBool == true {
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
        .environmentObject(DisplayView())
    }
}
