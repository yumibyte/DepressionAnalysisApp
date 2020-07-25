//
//  CreateUser.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/24/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import Foundation
import TwitterKit

class CreateUser: NSObject, ObservableObject {
    @EnvironmentObject var twitter: TwitterService
    
    @Published var profilePictureURL: String {
        willSet { self.objectWillChange.send(self) }
    }
    
    // Let objects change
    let objectWillChange = PassthroughSubject<CreateUser,Never>()

     
    func createUser(completion: @escaping (Result<String, Error>) -> Void) {
        TWTRTwitter.sharedInstance().logIn { (session, error) in
            let client = TWTRAPIClient.withCurrentUser()
            client.loadUser(withID: self.twitter.credential?.userId ?? "") { (user, error) in
                if let url = user?.profileImageURL {
                    completion(.success(url))

                } else if let error = error {
                    completion(.failure(error))
                }

            }
        }
    }
}
