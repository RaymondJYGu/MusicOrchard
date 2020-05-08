//
//  GameScene.swift
//  Movement
//
//  Created by Benjamin Blomquist on 3/5/20.
//  Copyright © 2020 Benjamin Blomquist. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class BG: SKSpriteNode{ }

class GameScene: SKScene {
    static let imageScale: CGFloat = 0.3
    
    //declare all variables
    var HomeButton = SKSpriteNode()
    
    var appleTree = Tree(filename: "appleTree")
    var apple = Fruit(image: "apple", instrument: "banjo")
    var apple2 = Fruit(image: "apple", instrument: "banjo")
    var apple3 = Fruit(image: "apple", instrument: "banjo")
    
    var bananaTree = Tree(filename: "coconutTree")
    var banana = Fruit(image: "banana", instrument: "voice")
    var banana2 = Fruit(image: "banana", instrument: "voice")
    var banana3 = Fruit(image: "banana", instrument: "voice")
    
    var coconutTree = Tree(filename: "coconutTree")
    var coconut = Fruit(image: "coconut", instrument: "cello")
    var coconut2 = Fruit(image: "coconut", instrument: "cello")
    var coconut3 = Fruit(image: "coconut", instrument: "cello")
    
    var lemonTree = Tree(filename: "lemonTree")
    var lemon = Fruit(image: "lemon", instrument: "trumpet")
    var lemon2 = Fruit(image: "lemon", instrument: "trumpet")
    var lemon3 = Fruit(image: "lemon", instrument: "trumpet")
    
    var peachTree = Tree(filename: "peachTree")
    var peach = Fruit(image: "peach", instrument: "sax")
    var peach2 = Fruit(image: "peach", instrument: "sax")
    var peach3 = Fruit(image: "peach", instrument: "sax")
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode (imageNamed: "farm bg")
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = -1
        addChild(background)
        
        let appleRoot = SKSpriteNode (imageNamed: "hole1")
        let bananaRoot = SKSpriteNode (imageNamed: "hole1")
        let coconutRoot = SKSpriteNode (imageNamed: "hole1")
        let lemonRoot = SKSpriteNode (imageNamed: "hole1")
        let peachRoot = SKSpriteNode (imageNamed: "hole1")
        
        appleTree.node.addChild(appleRoot)
        appleRoot.position = CGPoint(x: 10, y: -650)
        appleRoot.setScale(0.7)
        
        bananaTree.node.addChild(bananaRoot)
        bananaRoot.position = CGPoint(x: -40, y: -740)
        bananaRoot.setScale(0.7)
        
        coconutTree.node.addChild(coconutRoot)
        coconutRoot.position = CGPoint(x: -30, y: -730)
        coconutRoot.setScale(0.7)
        
        lemonTree.node.addChild(lemonRoot)
        lemonRoot.position = CGPoint(x: 10, y: -680)
        lemonRoot.setScale(0.7)
        
        peachTree.node.addChild(peachRoot)
        peachRoot.position = CGPoint(x: 10, y: -565)
        peachRoot.setScale(0.7)
        
        appleTree.grow(fruit: apple)
        appleTree.grow(fruit: apple2)
        appleTree.grow(fruit: apple3)
        appleTree.node.setScale(GameScene.imageScale)
        addChild(appleTree.node)
        appleTree.setPosition(xPosition: 400, yPosition: -100)
        
        bananaTree.grow(fruit: banana)
        bananaTree.grow(fruit: banana2)
        bananaTree.grow(fruit: banana3)
        bananaTree.node.setScale(GameScene.imageScale)
        addChild(bananaTree.node)
        bananaTree.setPosition(xPosition: 50, yPosition: -150)
        
        coconutTree.grow(fruit: coconut)
        coconutTree.grow(fruit: coconut2)
        coconutTree.grow(fruit: coconut3)
        coconutTree.node.setScale(GameScene.imageScale)
        addChild(coconutTree.node)
        coconutTree.setPosition(xPosition: 230, yPosition: 190)
        
        lemonTree.grow(fruit: lemon)
        lemonTree.grow(fruit: lemon2)
        lemonTree.grow(fruit: lemon3)
        lemonTree.node.setScale(GameScene.imageScale)
        addChild(lemonTree.node)
        lemonTree.setPosition(xPosition: -350, yPosition: -160)
        
        peachTree.grow(fruit: peach)
        peachTree.grow(fruit: peach2)
        peachTree.grow(fruit: peach3)
        peachTree.node.setScale(GameScene.imageScale)
        addChild(peachTree.node)
        peachTree.setPosition(xPosition: -200, yPosition: 165)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
