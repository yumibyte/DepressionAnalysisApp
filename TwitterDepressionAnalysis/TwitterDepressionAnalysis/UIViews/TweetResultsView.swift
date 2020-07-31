//
//  TweetResultsView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/27/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import SwiftUI
import TwitterKit
import CoreML
import NaturalLanguage
struct TweetResultsView: View {
    
    
    
    @State var tweetArray: [String]?
    @EnvironmentObject var displayView: DisplayView
    @EnvironmentObject var twitter: TwitterService
//    @State var showTweetActions: Bool?
    
    let findAPIKey = FindAPIKey()
    
    func readTweets() {
        print(tweetArray)
        
        do {
            CleanTweet().filterTweet(input: "abc :@http://apple.com/@ xxx    don't     🚚")
//            let fileName = "/Users/ashleyraigosa/Desktop/Programming/IAIF/DepressionAnalysisApp/LSTM_CNN_MLModel/LSTM_CNN_Trained.mlmodel"
//            let filePath = URL(string: "file://\(fileName)")
//            let model = LSTM_CNN_Trained()
//            let lstm_1_h_in =
//
//            let modelOutput = try model.prediction(text: <#T##MLMultiArray#>, lstm_1_h_in: <#T##MLMultiArray?#>, lstm_1_c_in: <#T##MLMultiArray?#>)
//            let res = marsHabitatPricerOutput.price
//            print(res)
            
//            let mlModel = try MarsHabitatPricer(configuration: MLModelConfiguration()).model
//            let customModel = try NLModel(mlModel: mlModel)
//            let compiledModel = try MLModel.compileModel(at: url)
//            let model = try NLModel(contentsOf: compiledModel)
//            let customModel = try NLModel(mlModel: mlModel)
            
            // retrieve prediction
//            if let prediction = model.predictedLabel(for: "i have depression") {
//                print(prediction)
//            }
            
        } catch {
            print(error)
        }
        
        
        //Import MLModel
//        let modelPath = "/Users/ashleyraigosa/Desktop/Programming/IAIF/DepressionAnalysisApp/LSTM_CNN_Trained.mlmodel"
//        let url = URL(string: modelPath)!
//        let model: NLModel = try String(mlModel: LSTM_CNN_Trained())
    
        
        
//        var tweets = [LSTM_CNN_TrainedInput]()
//
//        var tweetArrayInt: [Int]
//        for x in 0..<tweetArray!.count {
//
//            var tweet:Int = Int(x)
//            tweetArrayInt.append(tweet)
//        }
//        guard let tweetMLArray = try? MLMultiArray(shape: [140], dataType: MLMultiArrayDataType.double) else {
//            fatalError("Unexpected runtime error. MLMultiArray")
//        }
//
//
//        for i in 0..<tweetMLArray.count {
//            let tweetForClassification = LSTM_CNN_TrainedInput(text: tweetMLArray)
//
//        }
            
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TweetsTableUIViewStruct(twitter: self.twitter)
            }.offset(y: -300)
        }.navigationBarBackButtonHidden(true)
            .onAppear() {
                TweetsTableViewClass(twitter: self.twitter).loadTweets() { tweetArray in
                    self.tweetArray = tweetArray
                    //                    image in
                    //                    self.placeHolderImage = Image(uiImage: image)
                    self.readTweets()
                }
                
                
        }
    }
}

struct TweetResultsView_Previews: PreviewProvider {
    static var previews: some View {
        TweetResultsView()
    }
}
