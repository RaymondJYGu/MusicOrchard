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
    
    var lemonTree = SKSpriteNode()
    var appleTree = SKSpriteNode()
    var bananaTree = SKSpriteNode()
    let pianoSound = SKAction.playSoundFileNamed("piano-intro.wav", waitForCompletion: false)
    let gMajSound = SKAction.playSoundFileNamed("g-maj.wav", waitForCompletion: false)
    
    var myTree = Tree(filename: "coconutTree", width: 300, height: 300, xPosition: 0, yPosition: 0)
    var coconut = Fruit(filename: "coconut2", width: 300, height: 300, xPosition: 0, yPosition: 0, musicName: "cello - medium a.wav")
    var coconut2 = Fruit(filename: "coconut2", width: 300, height: 300, xPosition: 0, yPosition: 0, musicName: "cello - medium c.wav")
    
    
    // playing around with SKAction sequencing
    let vocalShortA = SKAction.playSoundFileNamed("voice - short a", waitForCompletion: true)
    let vocalMediumD = SKAction.playSoundFileNamed("voice - medium d", waitForCompletion: true)
    let vocalMediumG = SKAction.playSoundFileNamed("voice - medium g", waitForCompletion: true)
    let celloMediumA = SKAction.playSoundFileNamed("cello - medium a", waitForCompletion: true)
    let pause = SKAction.pause()
    let wait = SKAction.wait(forDuration: 1)
    let wait2 = SKAction.wait(forDuration: 2)
    
    override func didMove(to view: SKView) {
        //foo
        let background = SKSpriteNode (imageNamed: "farm bg")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = -1
        addChild(background)
        
        appleTree = SKSpriteNode(imageNamed: "apple tree")
        appleTree.position = CGPoint(x: frame.midX + 400, y: frame.midY - 200)
        addChild(appleTree)
        
        bananaTree = SKSpriteNode(imageNamed: "banana tree")
        bananaTree.position = CGPoint(x: frame.midX + 100, y: frame.midY - 200)
        addChild(bananaTree)
        self.anchorPoint = CGPoint(x:0.5,y:0.5)
        
        lemonTree = SKSpriteNode(imageNamed: "lemon tree")
        lemonTree.position = CGPoint(x: frame.midX - 250, y: frame.midY + 100)
        addChild(lemonTree)

        myTree.addFruit(fruit: coconut)
        myTree.addFruit(fruit: coconut2)
        addChild(myTree.node)
        myTree.setPosition(xPosition: 100, yPosition: 100)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        
        if myTree.node.contains(touch.location(in: coconut.node) ) {
            coconut.playMusic()
            myTree.deleteFruit(fruit: coconut, number: 0)
        }
        if myTree.node.contains(touch.location(in: coconut2.node) ) {
            coconut2.playMusic()
            myTree.deleteFruit(fruit: coconut2, number: 1)
        }
//        temporarily commented this out to test SKAction sequencing
//
//        if myTree.node.contains(touch.location(in: self)) {
//            coconut.playMusic()
//        }

//        this works right now! a couple different variations on what sequences could be
//        if appleTree.contains(touch.location(in: self)) {
//            run(SKAction.sequence([vocalMediumG, wait2, vocalMediumG, wait, vocalMediumG]))
//        }
        
        if lemonTree.contains(touch.location(in: self)) {
//            run(SKAction.sequence([vocalMediumD, vocalMediumG, wait, vocalShortA]))
            run(SKAction.sequence([celloMediumA, wait, vocalMediumD, wait, vocalMediumD]))
        }
        if bananaTree.contains(touch.location(in: self)) {
//            run(SKAction.sequence([vocalShortA, wait, vocalMediumD, wait2, vocalMediumG]))
            run(SKAction.sequence([vocalShortA, vocalShortA, wait2, vocalShortA, vocalShortA, wait2, vocalShortA, vocalShortA]))
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

