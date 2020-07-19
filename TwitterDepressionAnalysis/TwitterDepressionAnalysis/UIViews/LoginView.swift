//
//  ContentView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/12/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var twitter: TwitterService
    
    var body: some View {
        VStack {
            Text("Login to Twitter Depression Analysis")
                .minimumScaleFactor(0.5)

                .font(.system(size: 30, weight: .medium, design: .default))
                .multilineTextAlignment(.center)
                .padding()
                .offset(y: -90)
            // Create twitter login button
                ZStack(alignment: .center) {
                    Rectangle()
                        .frame(width: 340, height: 60)
                        .foregroundColor(Color(red: 80 / 255, green: 171 / 255, blue: 241 / 255))
                        .cornerRadius(10)
                    HStack {
                        Button(action: { self.twitter.authorize() }) {
                            Text("Sign in with Twitter")
                        }
                        Text(twitter.credential?.userId ?? "")
                        Text(twitter.credential?.screenName ?? "")
                    }
                    .sheet(isPresented: self.$twitter.showSheet) {
                        CustomSafariViewController.SafariView(url: self.$twitter.authUrl)
                        
                    }
                    .minimumScaleFactor(0.5)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .lineLimit(1)
                    .offset(x: 30)
                    
                    Image("TwitterLogo")
                        .scaleEffect(0.26)
                        .offset(x: -120)
            }.offset(y: 80)
        }
        
    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
        .environmentObject(TwitterService())

    }
}
