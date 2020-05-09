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
    
    var activated = false
    var isWorking = false
    var instructionButton = SKSpriteNode(imageNamed: "help icon")
    var instruction = SKSpriteNode(imageNamed: "instructions blue")
    
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
        
        instructionButton.setScale(1)
        instructionButton.position = CGPoint(x: frame.minX + 0.6 * instructionButton.size.width, y: frame.maxY - 0.6 * instructionButton.size.height)
        addChild(instructionButton)
        
        instruction.setScale(1)
        instruction.position = CGPoint(x: instructionButton.position.x + instructionButton.size.width, y: instructionButton.position.y)
        instruction.zPosition = 1000
        
        let appleRoot = SKSpriteNode (imageNamed: "dirt mound")
        let bananaRoot = SKSpriteNode (imageNamed: "dirt mound")
        let coconutRoot = SKSpriteNode (imageNamed: "dirt mound")
        let lemonRoot = SKSpriteNode (imageNamed: "dirt mound")
        let peachRoot = SKSpriteNode (imageNamed: "dirt mound")
        
        appleTree.node.addChild(appleRoot)
        appleRoot.position = CGPoint(x: 0, y: -640)
        appleRoot.setScale(1)
        appleRoot.zPosition = 3
        
        bananaTree.node.addChild(bananaRoot)
        bananaRoot.position = CGPoint(x: -70, y: -720)
        bananaRoot.setScale(1)
        bananaRoot.zPosition = 3
        
        coconutTree.node.addChild(coconutRoot)
        coconutRoot.position = CGPoint(x: -100, y: -730)
        coconutRoot.setScale(1)
        coconutRoot.zPosition = 1
        
        lemonTree.node.addChild(lemonRoot)
        lemonRoot.position = CGPoint(x: 10, y: -680)
        lemonRoot.setScale(1)
        lemonRoot.zPosition = 3
        
        peachTree.node.addChild(peachRoot)
        peachRoot.position = CGPoint(x: -30, y: -550)
        peachRoot.setScale(1)
        peachRoot.zPosition = 1
        
        appleTree.grow(fruit: apple)
        appleTree.grow(fruit: apple2)
        appleTree.grow(fruit: apple3)
        appleTree.node.setScale(GameScene.imageScale)
        appleTree.node.zPosition = 2
        addChild(appleTree.node)
        appleTree.setPosition(xPosition: 400, yPosition: -100)
        
        coconutTree.grow(fruit: coconut)
        coconutTree.grow(fruit: coconut2)
        coconutTree.grow(fruit: coconut3)
        coconutTree.node.setScale(GameScene.imageScale)
        addChild(coconutTree.node)
        coconutTree.setPosition(xPosition: 210, yPosition: 190)
        
        bananaTree.grow(fruit: banana)
        bananaTree.grow(fruit: banana2)
        bananaTree.grow(fruit: banana3)
        bananaTree.node.setScale(GameScene.imageScale)
        bananaTree.node.zPosition = 2
        addChild(bananaTree.node)
        bananaTree.setPosition(xPosition: 50, yPosition: -150)
        
        lemonTree.grow(fruit: lemon)
        lemonTree.grow(fruit: lemon2)
        lemonTree.grow(fruit: lemon3)
        lemonTree.node.setScale(GameScene.imageScale)
        lemonTree.node.zPosition = 2
        addChild(lemonTree.node)
        lemonTree.setPosition(xPosition: -350, yPosition: -160)
        
        peachTree.grow(fruit: peach)
        peachTree.grow(fruit: peach2)
        peachTree.grow(fruit: peach3)
        peachTree.node.setScale(GameScene.imageScale)
        addChild(peachTree.node)
        peachTree.setPosition(xPosition: -200, yPosition: 165)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        if instructionButton.contains(touch.location(in: self)) {
            if !isWorking {
                isWorking = true
                if(!activated) {
                    instruction.alpha = 0
                    instruction.position = CGPoint(x: instructionButton.position.x + instructionButton.size.width, y: instructionButton.position.y)
                        addChild(instruction)
                        instruction.run(SKAction.moveBy(x: 165, y: 0, duration: 0.5))
                    instruction.run(SKAction.fadeIn(withDuration: 0.5))
                    activated = !activated
                    isWorking = false
                }
                else {
                    instruction.run(SKAction.moveBy(x: -25, y: 0, duration: 0.5))
                    instruction.run(SKAction.fadeOut(withDuration: 0.25)) {
                        self.instruction.removeFromParent()
                        self.activated = !self.activated
                        self.isWorking = false
                    }
                }
            }
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
