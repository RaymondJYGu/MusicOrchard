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
    
    //declare all variables
    var HomeButton = SKSpriteNode()
    var lemonTree = SKSpriteNode()
    var appleTree = SKSpriteNode()
    var bananaTree = SKSpriteNode()
    let pianoSound = SKAction.playSoundFileNamed("piano-intro.wav", waitForCompletion: false)
    let gMajSound = SKAction.playSoundFileNamed("g-maj.wav", waitForCompletion: false)
    var coconutTree = Tree(filename: "coconutTree", width: 300, height: 300, xPosition: 0, yPosition: 0)
    var coconut = Fruit(filename: "coconut", width: 300, height: 300, xPosition: 0, yPosition: 0, musicName: "cello - medium a.wav")
    var coconut2 = Fruit(filename: "coconut", width: 300, height: 300, xPosition: 0, yPosition: 0, musicName: "cello - medium c.wav")
    
    
    // playing around with SKAction sequencing
    let vocalShortA = SKAction.playSoundFileNamed("voice - short a", waitForCompletion: true)
    let vocalShortD = SKAction.playSoundFileNamed("voice - short d", waitForCompletion: true)
    let vocalShortG = SKAction.playSoundFileNamed("voice - short g", waitForCompletion: true)
    let celloShortA = SKAction.playSoundFileNamed("cello - short a", waitForCompletion: true)
    let celloShortC = SKAction.playSoundFileNamed("cello - short c", waitForCompletion: true)
    let celloShortE = SKAction.playSoundFileNamed("cello - short e", waitForCompletion: true)
    let trumpetShortD = SKAction.playSoundFileNamed("trumpet - short d", waitForCompletion: true)
    let trumpetShortA = SKAction.playSoundFileNamed("trumpet - short a", waitForCompletion: true)
    let wait = SKAction.wait(forDuration: 1)
    let wait2 = SKAction.wait(forDuration: 2)
    
    override func didMove(to view: SKView) {
        //foo
        let background = SKSpriteNode (imageNamed: "farm bg")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = -1
        addChild(background)
        
        appleTree = SKSpriteNode(imageNamed: "appleTree")
        appleTree.position = CGPoint(x: frame.midX + 400, y: frame.midY - 180)
        appleTree.setScale(0.25)
        addChild(appleTree)
        
        bananaTree = SKSpriteNode(imageNamed: "bananaTree")
        bananaTree.position = CGPoint(x: frame.midX + 50, y: frame.midY - 150)
        bananaTree.setScale(0.25)
        addChild(bananaTree)
        self.anchorPoint = CGPoint(x:0.5,y:0.5)
        
        lemonTree = SKSpriteNode(imageNamed: "lemonTree")
        lemonTree.position = CGPoint(x: frame.midX - 400, y: frame.midY + 100)
        lemonTree.setScale(0.25)
        addChild(lemonTree)

        coconutTree.addFruit(fruit: coconut)
        coconutTree.addFruit(fruit: coconut2)
        coconutTree.node.setScale(0.25)
        addChild(coconutTree.node)
        coconutTree.setPosition(xPosition: 300, yPosition: 100)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        
        if coconutTree.node.contains(touch.location(in: coconut.node) ) {
            coconut.playMusic()
            coconutTree.deleteFruit(fruit: coconut, number: 0)
        }
        if coconutTree.node.contains(touch.location(in: coconut2.node) ) {
            coconut2.playMusic()
            coconutTree.deleteFruit(fruit: coconut2, number: 1)
        }
//        temporarily commented this out to test SKAction sequencing
//
//        if myTree.node.contains(touch.location(in: self)) {
//            coconut.playMusic()
//        }

//        this works right now! a couple different variations on what sequences could be
        if appleTree.contains(touch.location(in: self)) {
            run(SKAction.sequence([vocalShortA, wait, vocalShortD, wait, vocalShortG]))
        }
        
        if lemonTree.contains(touch.location(in: self)) {
            run(SKAction.sequence([celloShortA, wait, celloShortC, celloShortC, celloShortE]))
        }
        if bananaTree.contains(touch.location(in: self)) {
            run(SKAction.sequence([trumpetShortA, trumpetShortD, wait, trumpetShortD]))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
            if bananaTree.contains(touch.location(in: self)) {
                bananaTree.position.x = location.x
                bananaTree.position.y = location.y
            }
//            if lemonTree.contains(touch.location(in: self)) {
//                lemonTree.position.x = location.x
//                lemonTree.position.y = location.y
//            }
//            if appleTree.contains(touch.location(in: self)) {
//                appleTree.position.x = location.x
//                appleTree.position.y = location.y
//            }

        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

