//
//  SwiftNLCGloVeModel.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 8/2/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import Foundation
import CoreML

class SwiftNLCGloVeModel {

    let maxLength = 20
    let vectorSize = 100
    var lemmatizer = Lemmatizer()

    lazy var wordDictionary: [String: Int] = {
        return try! JSONDecoder().decode(Dictionary<String, Int>.self, from: Data(contentsOf: Bundle.main.url(forResource:"Words", withExtension: "json")!))
    }()
    
    lazy var classes: [String] = {
        return try! JSONDecoder().decode(Array<String>.self, from: Data(contentsOf: Bundle.main.url(forResource:"Classes", withExtension: "json")!))
    }()

    func predict(_ utterance: String) -> (LSTM_CNN_TrainedOutput)? {
        let words = lemmatizer.lemmatize(text: utterance).compactMap { $0.0 } //$0.1 for lemma -- $0.0 Do not take lemma but original word !!!
        var embedding = [Int]()
        for word in words {
            embedding.append(wordDictionary[word] ?? 0)
        }
        
        let model = LSTM_CNN_Trained()
        
        let maxLengthNumber = NSNumber(value: maxLength)
        guard let input_data = try? MLMultiArray(shape:[maxLengthNumber,1,1], dataType:.double) else {
            fatalError("Unexpected runtime error: input_data")
        }
        
        let vectorSizeNumber = NSNumber(value: vectorSize)
        guard let lstm_1_h_in = try? MLMultiArray(shape:[vectorSizeNumber], dataType:.double) else {
            fatalError("Unexpected runtime error: gru_1_h_in")
        }
        guard let lstm_1_c_in = try? MLMultiArray(shape: [vectorSizeNumber], dataType:.double) else {
            fatalError("Unexpected runtime error: lstm_1_c_in")
        }
        
        for i in 0..<vectorSize {
            lstm_1_h_in[i] = NSNumber(value: 0.0)
        }
        
        for i in 0..<vectorSize {
            lstm_1_c_in[i] = NSNumber(value: 0.0)
        }
        
        var i = 0
        while i<embedding.count && i<maxLength {
            input_data[i] = NSNumber(value: embedding[i])
            i += 1
        }
        while i<maxLength {
            input_data[i] = NSNumber(value: 0.0)
            i += 1
        }
        
        do {
            let input = try LSTM_CNN_TrainedInput(text: input_data, lstm_1_h_in: lstm_1_h_in, lstm_1_c_in: lstm_1_c_in)
            
            guard let prediction = try? model.prediction(input: input) else {
                fatalError("Unexpected runtime error: prediction")
            }
            print(prediction)
            return prediction
//                var max:Double = 0.0
//                var pos = -1
//                for i in 0..<classes.count {
//                    let value = prediction.classes.count
//                    if value > max {
//                        max = value
//                        pos = i
//                    }
//                }
//
//                return (classes[pos], max)
        } catch {
            fatalError()
        }
        
    }
}
