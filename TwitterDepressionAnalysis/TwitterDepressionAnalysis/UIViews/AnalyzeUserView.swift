//
//  AnalyzeUserView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/20/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI
import ChameleonFramework
struct AnalyzeUserView: View {
    
    @EnvironmentObject var twitter: TwitterService
    
    func analyzeUser() {
        print("run analyzeUser")
    }
    
    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                    // Analyze user Button
                    Button(action: analyzeUser) {
                        Text("Analyze User")
                    }.frame(width: 180, height: 50)
                        .background(Color(FlatSkyBlue()))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .font(.system(size: 16, weight: .medium, design: .default))
                }.offset(y: 80)
                .navigationBarTitle("Analytics", displayMode: .inline)
                
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct AnalyzeUserView_Previews: PreviewProvider {
    static var previews: some View {
            AnalyzeUserView()
    }
}
