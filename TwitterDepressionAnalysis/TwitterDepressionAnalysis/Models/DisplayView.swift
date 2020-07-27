//
//  DisplayView.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/27/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import Foundation

class DisplayView: ObservableObject {
    
    init(displayView: Bool) {
        self.displayView = displayView
    }
    var displayView: Bool
}
