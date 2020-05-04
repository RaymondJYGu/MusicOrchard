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
    var filename: String
    var node: SKSpriteNode
    var fruits: [Fruit]
    var width: Double
    var height: Double
    var xPosition: Double
    var yPosition: Double
    var touches: [Int]
    
    init(filename: String) {
        node = SKSpriteNode(imageNamed: filename)
        self.filename = filename
        fruits = []
        self.width = 0
        self.height = 0
        self.xPosition = 0
        self.yPosition = 0
        touches = []
        setSize(width: width, height: height)
        setPosition(xPosition: xPosition, yPosition: yPosition)
    }
    
    func addFruit(fruit: Fruit) {
        let number = Int.random(in: 1...5)
        fruit.setSize(width: 1000, height: 750)
        fruit.setPosition(xPosition: Double(-650 + (200 * number)), yPosition: -75)
        fruit.node.zPosition = node.zPosition + 1
        node.addChild(fruit.node)
        fruits.append(fruit)
    }
    
    func deleteFruit(fruit: Fruit, number: Int) {
        fruits.remove(at: number)
        node.removeChildren(in: [fruit.node])
        addFruit(fruit: fruit)
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

    
}
