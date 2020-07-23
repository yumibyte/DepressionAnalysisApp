//
//  AnalyzeUserView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/20/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI
import ChameleonFramework
import TwitterKit

struct AnalyzeUserView: View {
    
    let findAPIKey = FindAPIKey()
    @EnvironmentObject var twitter: TwitterService
    func createUser() {
        TWTRTwitter.sharedInstance().logIn { (session, error) in
            let client = TWTRAPIClient.withCurrentUser()
            client.loadUser(withID: self.twitter.credential?.userId ?? "") { (user, error) in
                let profilePicture = user?.profileImageURL
            }
        }
    }
    
    
    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                    // Analyze user Button
//                    Image(self.profilePicture)
                    Button(action: createUser) {
                        Text("Analyze User")
                    }.frame(width: 180, height: 50)
                        .background(Color(FlatSkyBlue()))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .font(.system(size: 16, weight: .medium, design: .default))
                }.offset(y: 80)
                .navigationBarTitle("Analytics", displayMode: .inline)
                
            }.onAppear { self.createUser() }
        }.navigationBarBackButtonHidden(true)
    }
}

struct AnalyzeUserView_Previews: PreviewProvider {
    static var previews: some View {
            AnalyzeUserView()
    }
}
