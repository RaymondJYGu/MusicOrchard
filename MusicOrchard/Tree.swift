//
//  Tree.swift
//  MusicOrchard
//
//  Created by Chenxin Zhu on 4/19/20.
//  Copyright © 2020 Benjamin Blomquist. All rights reserved.
//

import Foundation
import SpriteKit

class Tree {
    var root: SKSpriteNode!
    var fruits: [SKSpriteNode]
    var filename: String
    var width: Double
    var height: Double
    var xPosition: Double
    var yPosition: Double
    
    init(_ filename: String, _ width: Double, _ height: Double, _ xPosition: Double = 0, _ yposition: Double = 0) {
        self.root = SKSpriteNode(fileNamed: filename)
        self.fruits = [SKSpriteNode]()
        self.filename = filename
        self.width = width
        self.height = height
        root.size = CGSize(width: width, height: height)
        self.xPosition = xPosition
        self.yPosition = yposition
    }
    
    func setSize(width: Double, height: Double) {
        root.scale(to: CGSize(width: width, height: height))
        self.width = width
        self.height = height
    }
    
    func setPosition(xPosition: Double, yPosition: Double) {
        self.xPosition = xPosition
        self.yPosition = yPosition
        root.anchorPoint = CGPoint(x: xPosition, y: yPosition)
    }
    
    func addFruit(fruit: SKSpriteNode, width: Double, height: Double, xPosition: Double, yPosition: Double) {
        fruit.scale(to: CGSize(width: width, height: height))
        fruit.anchorPoint = CGPoint(x: xPosition, y: yPosition)
        fruits.append(fruit)
        root.addChild(fruit)
    }
}
