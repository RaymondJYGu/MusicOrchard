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
    var width: Double
    var height: Double
    var xPosition: Double
    var yPosition: Double
    let treeSpots: [Spot] = [
        Spot(position: CGPoint(x: -300, y: -75), occupied: false),
        Spot(position: CGPoint(x: -250, y: -10), occupied: false),
        Spot(position: CGPoint(x: -50, y: -50), occupied: false),
        Spot(position: CGPoint(x: 150, y: -30), occupied: false),
        Spot(position: CGPoint(x: 300, y: -100), occupied: false)]
    var touches: [Int]
    
    init(filename: String) {
        node = SKSpriteNode(imageNamed: filename)
        self.filename = filename
        self.width = 0
        self.height = 0
        self.xPosition = 0
        self.yPosition = 0
        touches = []
        setSize(width: width, height: height)
        setPosition(xPosition: xPosition, yPosition: yPosition)
    }
    
    func grow(fruit: Fruit) {
        while true {
            let number = Int.random(in: treeSpots.indices)
            if !treeSpots[number].occupied {
                fruit.spot = treeSpots[number]
                treeSpots[number].fruit = fruit
                treeSpots[number].occupied = true
                let position = treeSpots[number].position
                fruit.setPosition(xPosition: Double(position.x), yPosition: Double(position.y))
                node.addChild(fruit.node)
                break
            }
        }
        fruit.node.zPosition = node.zPosition + 1
        fruit.grow()
    }
    
    func deleteFruit(fruit: Fruit) {
        fruit.node.removeFromParent()
        fruit.spot?.occupied = false
        fruit.spot?.fruit = nil
        fruit.spot = nil
        grow(fruit: fruit)
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

class Spot {
    var fruit: Fruit? = nil
    var position: CGPoint
    var occupied: Bool
    
    init(position: CGPoint, occupied: Bool) {
        self.position = position
        self.occupied = occupied
    }
}
