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
            Button(action: { self.twitter.authorize() }) {
                Text("Login with Twitter")
            }
            Text(twitter.credential?.userId ?? "")
            Text(twitter.credential?.screenName ?? "")
        }
        .sheet(isPresented: self.$twitter.showSheet) {
            CustomSafariViewController.SafariView(url: self.$twitter.authUrl)
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
