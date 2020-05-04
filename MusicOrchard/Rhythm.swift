//
//  Rhythm.swift
//  MusicOrchard
//
//  Created by Chenxin Zhu on 5/3/20.
//  Copyright © 2020 Benjamin Blomquist. All rights reserved.
//

import Foundation
import SpriteKit

class Rhythm {
    
    static let instruments = ["sax", "banjo", "trumpet", "cello", "voice"]
    static let lengths = ["medium", "short"]
    static let notes = ["a", "c", "d", "e", "g"]
    
    static func note(instrument: String, length: String, note: String, duration: TimeInterval) -> SKAction {
        SKAction.sequence([
            SKAction.playSoundFileNamed("\(instrument) - \(length) \(note).wav", waitForCompletion: false),
            SKAction.wait(forDuration: duration)
        ])
    }
    
    static func randomNote(instrument: String) -> SKAction {
        let length = lengths[Int.random(in: 0...1)]
        let note = notes[Int.random(in: 0...4)]
        let duration = TimeInterval(Int.random(in: 0...2)/10)
        return SKAction.sequence([
            SKAction.playSoundFileNamed("\(instrument) - \(length) \(note).wav", waitForCompletion: true),
            SKAction.wait(forDuration: duration)
        ])
    }
    
    static func generateRandomRhythm(instrument: String, numOfNotes: Int) -> SKAction {
        SKAction.sequence((1...numOfNotes).map{(Int) -> SKAction in
            randomNote(instrument: instrument)
        })
    }
    
}
