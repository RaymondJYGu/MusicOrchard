//
//  Fruit.swift
//  MusicOrchard
//
//  Created by Chenxin Zhu on 4/23/20.
//  Copyright © 2020 Benjamin Blomquist. All rights reserved.
//

import Foundation
import SpriteKit

class Fruit {
    var filename: String
    var node: SKSpriteNode
    var width: Double
    var height: Double
    var xPosition: Double
    var yPosition: Double
    var musicName: String
    var musicAction: SKAction
    
    init(filename: String) {
        node = SKSpriteNode(imageNamed: filename)
        self.filename = filename
        width = 0
        height = 0
        xPosition = 0
        yPosition = 0
        musicName = ""
        musicAction = SKAction()
    }
    
    init(filename: String, width: Double, height: Double, xPosition: Double, yPosition: Double, musicName: String) {
        node = SKSpriteNode(imageNamed: filename)
        self.filename = filename
        self.width = 0
        self.height = 0
        self.xPosition = 0
        self.yPosition = 0
        self.musicName = musicName
        musicAction = SKAction.playSoundFileNamed(musicName, waitForCompletion: false)
        setSize(width: width, height: height)
        setPosition(xPosition: xPosition, yPosition: yPosition)
    }
    
    func playMusic() {
        node.run(musicAction)
    }
    
    
    func setSize(width: Double, height: Double) {
        node.scale(to: CGSize(width: width, height: height))
        self.width = width
        self.height = height
    }
    
    func setPosition(xPosition: Double, yPosition: Double) {
        self.xPosition = xPosition
        self.yPosition = yPosition
        node.position = CGPoint(x: xPosition, y: yPosition)
    }

    func setMusic(musicName: String) {
        self.musicName = musicName
        musicAction = SKAction.playSoundFileNamed(musicName, waitForCompletion: false)
    }
    
    func getNode() -> SKSpriteNode {
        return node
    }
    
    func getSize() -> (Double, Double){
        return (width, height)
    }
    
    func getPosition() -> (Double, Double){
        return (xPosition, yPosition)
    }
    
}
