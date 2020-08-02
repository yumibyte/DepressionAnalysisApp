//
//  SwiftNLCModel.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 8/2/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import Foundation
import CoreML

class SwiftNLCModel {
    lazy var bagOfWords: BagOfWords = {
        return try! JSONDecoder().decode(BagOfWords.self, from: Data(contentsOf: Bundle.main.url(forResource:"bagOfWords", withExtension: "json")!))
    }()
    
    lazy var intents: [String] = {
        return try! JSONDecoder().decode(Array<String>.self, from: Data(contentsOf: Bundle.main.url(forResource:"intents", withExtension: "json")!))
    }()
    
    var lemmatizer = Lemmatizer()
    
    func predict(_ utterance: String) -> (String, Float)? {
        let lemmas = lemmatizer.lemmatize(text: utterance).compactMap { $0.1 }
        let embedding = bagOfWords.embed(arrayOfWords: lemmas)

        let model = LSTM_CNN_Trained()
        
//        let size = NSNumber(value: embedding.count)
        let size = NSNumber(value: embedding.count)
        let mlMultiArrayInput = try! MLMultiArray(shape:[300, 1, 1], dataType:MLMultiArrayDataType.double)
        
        for i in 0..<size.intValue {
            mlMultiArrayInput[i] = NSNumber(floatLiteral: Double(embedding[i]))
        }
        
        let prediction = try! model.prediction(input: LSTM_CNN_TrainedInput(text: mlMultiArrayInput))
        var pos = -1
        var max:Float = 0.0
        
        for i in 0..<prediction.output.count {
            let p = prediction.output[i].floatValue
            if p > max {
                max = p
                pos = i
            }
        }

        return pos >= 0 ? (intents[pos], max) : nil
    }
}
