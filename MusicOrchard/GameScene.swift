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
    
    var bananaTree = Tree(filename: "bananaTree")
    var banana = Fruit(image: "banana", instrument: "voice")
    var banana2 = Fruit(image: "banana", instrument: "voice")
    
    var coconutTree = Tree(filename: "coconutTree")
    var coconut = Fruit(image: "coconut", instrument: "cello")
    var coconut2 = Fruit(image: "coconut", instrument: "cello")
    
    var lemonTree = Tree(filename: "lemonTree")
    var lemon = Fruit(image: "lemon", instrument: "trumpet")
    var lemon2 = Fruit(image: "lemon", instrument: "trumpet")
    
    var peachTree = Tree(filename: "peachTree")
    var peach = Fruit(image: "peach", instrument: "sax")
    var peach2 = Fruit(image: "peach", instrument: "sax")
    
    override func didMove(to view: SKView) {
        //foo
        let background = SKSpriteNode (imageNamed: "farm bg")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = -1
        addChild(background)
        
        appleTree.grow(fruit: apple)
        appleTree.grow(fruit: apple2)
        appleTree.node.setScale(GameScene.imageScale)
        addChild(appleTree.node)
        appleTree.setPosition(xPosition: Double(frame.midX + 400), yPosition: Double(frame.midY - 100))
        
        bananaTree.grow(fruit: banana)
        bananaTree.grow(fruit: banana2)
        bananaTree.node.setScale(GameScene.imageScale)
        addChild(bananaTree.node)
        bananaTree.setPosition(xPosition: Double(frame.midX + 50), yPosition: Double(frame.midY - 150))
        
        coconutTree.grow(fruit: coconut)
        coconutTree.grow(fruit: coconut2)
        coconutTree.node.setScale(GameScene.imageScale)
        addChild(coconutTree.node)
        coconutTree.setPosition(xPosition: 230, yPosition: 200)
        
        lemonTree.grow(fruit: lemon)
        lemonTree.grow(fruit: lemon2)
        lemonTree.node.setScale(GameScene.imageScale)
        addChild(lemonTree.node)
        lemonTree.setPosition(xPosition: Double(frame.midX - 350), yPosition: Double(frame.midY - 200))
        
        peachTree.grow(fruit: peach)
        peachTree.grow(fruit: peach2)
        peachTree.node.setScale(GameScene.imageScale)
        addChild(peachTree.node)
        peachTree.setPosition(xPosition: -260, yPosition: 165)
        
    }

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

    // You might end up writing other SKAction music methods like this:
    //
    // let appleRhythm = SKAction.rhythm(instrument: "voice", length: 5, pulse: 0.1)


