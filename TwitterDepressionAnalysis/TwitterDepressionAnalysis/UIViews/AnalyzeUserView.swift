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
    
    func createImage(url: String) -> UIImage {
        return AsyncImage(
            url: URL(string: url)!,
            placeholder: Text("Loading...")
        ).aspectRatio(contentMode: .fit) as! UIImage
        
    }
    func readTweets() {
        // placeholder
    }
    
    var body: some View {
        VStack {
            
            NavigationView {
                ZStack {
                    Text("hi")
                    
                    
                    
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

                    
                    print("grabbed URL")
                    self.createImage(url: profileURL)

                    

                case .failure(let error):
                print(error.localizedDescription)
            }
        }
        }
    }
}

    

struct AnalyzeUserView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyzeUserView()
        
    }
}
