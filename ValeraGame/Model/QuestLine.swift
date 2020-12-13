//
//  QuestLine.swift
//  ValeraGame
//
//  Created by Nikita Shvad on 13.12.2020.
//

import Foundation

struct QuestLine {
    var questText: String
    var choice1: String
    var choice2: String
    var choice1Destination: Int
    var choice2Destination: Int
    var choice1MadeMessage: String
    var choice2MadeMessage: String
    var didEnd: Bool
    
}
