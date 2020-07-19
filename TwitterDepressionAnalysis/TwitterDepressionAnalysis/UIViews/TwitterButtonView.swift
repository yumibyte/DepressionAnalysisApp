//
//  TwitterButtonView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/19/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI
import ChameleonFramework

struct TwitterButtonView: View {

    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .frame(width: 340, height: 60)
                .foregroundColor(Color(red: 80 / 255, green: 171 / 255, blue: 241 / 255))
                .cornerRadius(10)
            HStack {
                Text("Sign in with Twitter")
                    .minimumScaleFactor(0.5)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .lineLimit(1)
                    .offset(x: 140)

                Image("TwitterLogo")
                    .scaleEffect(0.26)
                .offset(x: -190)
                
            }
            
            
            

        }
        
    }
}

struct TwitterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TwitterButtonView()
    }
}
