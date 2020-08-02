//
//  CleanTweet.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/30/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import Foundation
import PorterStemmer2
import NaturalLanguage
struct CleanTweet {
        
    let cList = [
      ["ain't", "am not"],
      ["aren't", "are not"],
      ["can't", "cannot"],
      ["can't've", "cannot have"],
      ["'cause", "because"],
      ["could've", "could have"],
      ["couldn't", "could not"],
      ["couldn't've", "could not have"],
      ["didn't", "did not"],
      ["doesn't", "does not"],
      ["don't", "do not"],
      ["hadn't", "had not"],
      ["hadn't've", "had not have"],
      ["hasn't", "has not"],
      ["haven't", "have not"],
      ["he'd", "he would"],
      ["he'd've", "he would have"],
      ["he'll", "he will"],
      ["he'll've", "he will have"],
      ["he's", "he is"],
      ["how'd", "how did"],
      ["how'd'y", "how do you"],
      ["how'll", "how will"],
      ["how's", "how is"],
      ["I'd", "I would"],
      ["I'd've", "I would have"],
      ["I'll", "I will"],
      ["I'll've", "I will have"],
      ["I'm", "I am"],
      ["I've", "I have"],
      ["isn't", "is not"],
      ["it'd", "it had"],
      ["it'd've", "it would have"],
      ["it'll", "it will"],
      ["it'll've", "it will have"],
      ["it's", "it is"],
      ["let's", "let us"],
      ["ma'am", "madam"],
      ["mayn't", "may not"],
      ["might've", "might have"],
      ["mightn't", "might not"],
      ["mightn't've", "might not have"],
      ["must've", "must have"],
      ["mustn't", "must not"],
      ["mustn't've", "must not have"],
      ["needn't", "need not"],
      ["needn't've", "need not have"],
      ["o'clock", "of the clock"],
      ["oughtn't", "ought not"],
      ["oughtn't've", "ought not have"],
      ["shan't", "shall not"],
      ["sha'n't", "shall not"],
      ["shan't've", "shall not have"],
      ["she'd", "she would"],
      ["she'd've", "she would have"],
      ["she'll", "she will"],
      ["she'll've", "she will have"],
      ["she's", "she is"],
      ["should've", "should have"],
      ["shouldn't", "should not"],
      ["shouldn't've", "should not have"],
      ["so've", "so have"],
      ["so's", "so is"],
      ["that'd", "that would"],
      ["that'd've", "that would have"],
      ["that's", "that is"],
      ["there'd", "there had"],
      ["there'd've", "there would have"],
      ["there's", "there is"],
      ["they'd", "they would"],
      ["they'd've", "they would have"],
      ["they'll", "they will"],
      ["they'll've", "they will have"],
      ["they're", "they are"],
      ["they've", "they have"],
      ["to've", "to have"],
      ["wasn't", "was not"],
      ["we'd", "we had"],
      ["we'd've", "we would have"],
      ["we'll", "we will"],
      ["we'll've", "we will have"],
      ["we're", "we are"],
      ["we've", "we have"],
      ["weren't", "were not"],
      ["what'll", "what will"],
      ["what'll've", "what will have"],
      ["what're", "what are"],
      ["what's", "what is"],
      ["what've", "what have"],
      ["when's", "when is"],
      ["when've", "when have"],
      ["where'd", "where did"],
      ["where's", "where is"],
      ["where've", "where have"],
      ["who'll", "who will"],
      ["who'll've", "who will have"],
      ["who's", "who is"],
      ["who've", "who have"],
      ["why's", "why is"],
      ["why've", "why have"],
      ["will've", "will have"],
      ["won't", "will not"],
      ["won't've", "will not have"],
      ["would've", "would have"],
      ["wouldn't", "would not"],
      ["wouldn't've", "would not have"],
      ["y'all", "you all"],
      ["y'alls", "you alls"],
      ["y'all'd", "you all would"],
      ["y'all'd've", "you all would have"],
      ["y'all're", "you all are"],
      ["y'all've", "you all have"],
      ["you'd", "you had"],
      ["you'd've", "you would have"],
      ["you'll", "you you will"],
      ["you'll've", "you you will have"],
      ["you're", "you are"],
      ["you've", "you have"]
    ]
    
    // remove contractions
    func filterTweet(input: String) {
        var removedContractions = input
        for x in (0..<cList.count) {
            let templateStringInput: String = cList[x][0]
            let templateStringResult: String = cList[x][1]
            if input.contains(templateStringInput) {
                let regex = try! NSRegularExpression(pattern: templateStringInput, options: .caseInsensitive)
                removedContractions = regex.stringByReplacingMatches(in: removedContractions, options: [], range: NSRange(0..<input.utf16.count), withTemplate: templateStringResult)
            }
        }
        //TODO: implement ftfy in Swift
        
        // remove puncuation
        let removedPuncuation = removedContractions.components(separatedBy: .punctuationCharacters).joined()
        
        // remove links
        let linkText: String = "@(https?://([-\\w\\.]+[-\\w])+(:\\d+)?(/([\\w/_\\.#-]*(\\?\\S+)?[^\\.\\s])?)?)@"
        let removedLinks = removedPuncuation.replacingOccurrences(of: linkText, with: "", options: .regularExpression, range: removedPuncuation.startIndex..<removedPuncuation.endIndex)
        
        // remove emojis
        let removedEmojis = removedLinks.stringByRemovingEmoji()
        
        // remove stopwords
        // stopwords taken from nltk 3.5
        let stopwords = ["i", "me", "my", "myself", "we", "our", "ours", "ourselves", "you", "you're", "you've", "you'll", "you'd", "your", "yours", "yourself", "yourselves", "he", "him", "his", "himself", "she", "she's", "her", "hers", "herself", "it", "it's", "its", "itself", "they", "them", "their", "theirs", "themselves", "what", "which", "who", "whom", "this", "that", "that'll", "these", "those", "am", "is", "are", "was", "were", "be", "been", "being", "have", "has", "had", "having", "do", "does", "did", "doing", "a", "an", "the", "and", "but", "if", "or", "because", "as", "until", "while", "of", "at", "by", "for", "with", "about", "against", "between", "into", "through", "during", "before", "after", "above", "below", "to", "from", "up", "down", "in", "out", "on", "off", "over", "under", "again", "further", "then", "once", "here", "there", "when", "where", "why", "how", "all", "any", "both", "each", "few", "more", "most", "other", "some", "such", "no", "nor", "not", "only", "own", "same", "so", "than", "too", "very", "s", "t", "can", "will", "just", "don", "don't", "should", "should've", "now", "d", "ll", "m", "o", "re", "ve", "y", "ain", "aren", "aren't", "couldn", "couldn't", "didn", "didn't", "doesn", "doesn't", "hadn", "hadn't", "hasn", "hasn't", "haven", "haven't", "isn", "isn't", "ma", "mightn", "mightn't", "mustn", "mustn't", "needn", "needn't", "shan", "shan't", "shouldn", "shouldn't", "wasn", "wasn't", "weren", "weren't", "won", "won't", "wouldn", "wouldn't"]
        
        var removedStopwords = removedEmojis
        for x in 0..<stopwords.count {
            if let range = removedStopwords.contains(word: stopwords[x]) {
                removedStopwords.removeSubrange(range)
            }

        }
        
        // stemming
        var stem = removedStopwords
        if let stemmer = PorterStemmer(withLanguage: .English) {
            stem = stemmer.stem(stem)
        }
        let cleanedTweet = stem.condenseWhitespace()
        
        // tokenization
        let tokenizer = NLTokenizer(unit: .word)
        tokenizer.string = cleanedTweet
        
        tokenizer.enumerateTokens(in: cleanedTweet.startIndex..<cleanedTweet.endIndex) { tokenRange, _ in
            print(cleanedTweet[tokenRange])
            return true
        }
    }
    
}
// remove emojis
extension String {
  func stringByRemovingEmoji() -> String {
    return String(self.filter { !$0.isEmoji() })
  }
}

extension Character {
  fileprivate func isEmoji() -> Bool {
    return Character(UnicodeScalar(UInt32(0x1d000))!) <= self && self <= Character(UnicodeScalar(UInt32(0x1f77f))!)
      || Character(UnicodeScalar(UInt32(0x2100))!) <= self && self <= Character(UnicodeScalar(UInt32(0x26ff))!)
  }
}

//remove stopwords
extension String {

    func contains(word : String) -> Range<String.Index>?
    {
        return self.range(of: "\\b\(word)\\b", options: .regularExpression)
    }
}

// remove double white spaces
extension String {
    func condenseWhitespace() -> String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
}

