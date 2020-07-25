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
    
    var profilePictureURL: String
    @EnvironmentObject var twitter: TwitterService

//     create user, retrieve profile picture
    
    func makeRequest(_ completion: @escaping (Result<(Data, URLResponse), Error>) -> Void) {
      URLSession.shared.dataTask(with: URL(string: "https://donnywals.com")!) { data, response, error in
        if let error = error {
          completion(.failure(error))
        } else if let data = data, let response = response {
          completion(.success((data, response)))
        }

        assertionFailure("We should either have an error or data + response.")
      }
    }

    
//    func createUser(completionHandler: @escaping (String?) -> String) {
//        TWTRTwitter.sharedInstance().logIn { (session, error) in
//            let client = TWTRAPIClient.withCurrentUser()
//            client.loadUser(withID: self.twitter.credential?.userId ?? "") { (user, error) in
//                self.profilePictureURL = user?.profileImageURL ?? ""
//                completionHandler(self.profilePictureURL)
//            }
//        }
//
//    }
//
    func readTweets() {
        // placeholder
    }
    
    var body: some View {
        VStack {
            
            NavigationView {
                ZStack {
                    Text("hi")
                    
//                    AsyncImage(
//                        url: URL(string: self.profilePictureURL!)!,
//                        placeholder: Text("Loading...")
//                    ).aspectRatio(contentMode: .fit)

                    
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
                    case .success(let url):
                        
                        self.profilePictureURL = url
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
        AnalyzeUserView()
        
    }
}
//TWTRTwitter.sharedInstance().logIn { (session, error) in
//    let client = TWTRAPIClient.withCurrentUser()
//    client.loadUser(withID: self.twitter.credential?.userId ?? "") { (user, error) in
//        let profilePicture = user?.profileImageURL
//        print(profilePicture)
//    }
//}
