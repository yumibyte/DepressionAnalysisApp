//
//  TwitterButtonView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/19/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI

struct TwitterButtonView: View {
    var body: some View {
        VStack() {
            Rectangle()
                .frame(width: 180, height: 60)
                .foregroundColor(.blue)
                .overlay(
            Text("Login with Twitter")
                .foregroundColor(.white)
            )

        }
        
    }
}

struct TwitterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TwitterButtonView()
    }
}
