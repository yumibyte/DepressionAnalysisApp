//
//  ContentView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/12/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI
import TwitterKit

struct LoginView: View {
    
    @EnvironmentObject var twitter: TwitterService
    var body: some View {

        NavigationView {
            
            VStack {
                Text("Login to Spero")
                    .minimumScaleFactor(0.5)

                    .font(.system(size: 30, weight: .medium, design: .default))
                    .multilineTextAlignment(.center)
                    .padding()
                    .offset(y: -90)
                // Create twitter login button
                
                ZStack(alignment: .center) {
                    Image("SparrowLogo_00000").resizable()
                        .frame(width: 100, height: 100)
                        .offset(y: -380)
                    
                    
                    Rectangle()
                        .frame(width: 340, height: 60)
                        .foregroundColor(Color(red: 80 / 255, green: 171 / 255, blue: 241 / 255))
                        .cornerRadius(10)
                        HStack {
                            
                            Button(action: { self.twitter.authorize() }) {
                                
                                Text("Sign in with Twitter").fixedSize()
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .medium, design: .default))
                                    .lineLimit(1)
                                    .offset(x: 125)
                                
                                Image("TwitterLogo")
                                    .scaleEffect(0.26)
                                    .offset(x: -215)
                                
                                
                                NavigationLink(destination: FullTwitterDisplayView(), isActive: self.$twitter.isActive) {
                                    EmptyView()
                                }
                                    
                                .sheet(isPresented: self.$twitter.showSheet) {
                                    CustomSafariViewController.SafariView(url: self.$twitter.authUrl)


                                }
                                
                                
                                
                                
                        }
                    }
                    
                }
            }.buttonStyle(PlainButtonStyle())
                .offset(y: 50)
        }

    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
        .environmentObject(TwitterService())

    }
}
