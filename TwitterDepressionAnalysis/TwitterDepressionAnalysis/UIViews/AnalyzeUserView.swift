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
    @State var user: Array<String>?
    @EnvironmentObject var twitter: TwitterService
    @State var createView: Bool
    
    func createUser(completion: @escaping (Result<Array<String>, Error>) -> Void) {
        
        TWTRTwitter.sharedInstance().logIn { (session, error) in
            let client = TWTRAPIClient.withCurrentUser()
            client.loadUser(withID: self.twitter.credential?.userId ?? "") { (user, error) in
                if let screenName = self.twitter.credential?.screenName {
                    if let imageURL = user?.profileImageURL {
                        completion(.success([imageURL,screenName]))
                    }
                } else if let error = error {
                    completion(.failure(error))
                }

            }
        }
    }
    
    
    func readTweets() {
        // placeholder
    }
    
    var body: some View {
        VStack {
            
            NavigationView {
                VStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 250, height: 250)
                            .cornerRadius(10)
                            .offset(y: -125)
                            .foregroundColor(Color(FlatWhite()))
                        // Line separator
                        Rectangle()
                            .frame(width: 210, height: 2)
                            .cornerRadius(20)
                            .offset(y: -190)
                            .foregroundColor(Color(FlatGray()))
                        Text("currently logged in as:")
                            .font(.system(size: 20, weight: .light, design: .default))
                            
                            .offset(y: -210)
                        

                        if createView {
                            
                            // Display Profile Picture
                            AsyncImage(
                                url: URL(string: user![0])!,
                                placeholder: Text("Loading...")
                            )
                            .frame(width: 90, height: 90)
                            .foregroundColor(.white)
                            .offset(y: -125)
                            
                            // Display Username
                            Text(user![1])
                            .offset(y: -50)
                            .font(.system(size: 18, weight: .medium, design: .default))
                            
                        }
                        
                        // Analyze user Button
                        Button(action: readTweets) {
                            Text("Analyze User")
                            
                        }.frame(width: 180, height: 50)
                            .background(Color(FlatSkyBlue()))
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .offset(y: 90)
                    }
                    
                    
                    
                    
                }
            }
        }.navigationBarBackButtonHidden(true)
            
        .onAppear() {
            self.createUser() { result in
            switch result {
            case .success(let user):
                    self.user = user
                    self.createView = true
                    print("grabbed URL")

                    

                case .failure(let error):
                print(error.localizedDescription)
            }
        }
        }
        .navigationBarTitle("Analytics", displayMode: .inline)
//        .edgesIgnoringSafeArea(.top)

    }
}

    

struct AnalyzeUserView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyzeUserView(createView: false)
        
    }
}
