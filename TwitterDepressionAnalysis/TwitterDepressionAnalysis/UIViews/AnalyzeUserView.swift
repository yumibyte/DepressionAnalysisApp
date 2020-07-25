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
    @State var profilePictureURL: String?
    @EnvironmentObject var twitter: TwitterService
    @State var createView: Bool
    
    func createUser(completion: @escaping (Result<String, Error>) -> Void) {
        TWTRTwitter.sharedInstance().logIn { (session, error) in
            let client = TWTRAPIClient.withCurrentUser()
            client.loadUser(withID: self.twitter.credential?.userId ?? "") { (user, error) in
                if let imageURL = user?.profileImageURL {
                    completion(.success(imageURL))

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
                ZStack {
                    Text("hi")
                    
                    if createView {
                        AsyncImage(
                            url: URL(string: profilePictureURL!)!,
                            placeholder: Text("Loading...")
                        ).aspectRatio(contentMode: .fit)
                    }
                    
                    
                    // Analyze user Button
                    Button(action: readTweets) {
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
        .onAppear() {
            self.createUser() { result in
            switch result {
                case .success(let profileURL):
                    self.profilePictureURL = profileURL
                    self.createView = true
                    print("grabbed URL")

                    

                case .failure(let error):
                print(error.localizedDescription)
            }
        }
        }
    }
}

    

struct AnalyzeUserView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyzeUserView(createView: false)
        
    }
}
