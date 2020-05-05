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
    var xPosition: Double
    var yPosition: Double
    var spot: Spot? = nil

    
    init(filename: String) {
        node = SKSpriteNode(imageNamed: filename)
        self.filename = filename
        self.xPosition = 0
        self.yPosition = 0
        setPosition(xPosition: xPosition, yPosition: yPosition)
    }
    
    func setPosition(xPosition: Double, yPosition: Double) {
        self.xPosition = xPosition
        self.yPosition = yPosition
        node.position = CGPoint(x: xPosition, y: yPosition)
    }
    
    func grow() {
        node.setScale(0)
        let scale = SKAction.scale(to: GameScene.imageScale, duration: 5)
        self.node.run(scale)
    }
}
