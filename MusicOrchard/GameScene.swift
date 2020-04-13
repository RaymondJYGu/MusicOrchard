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


    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        
        if lemonTree.contains(touch.location(in: self)) {
            run(pianoSound)
        }
        
        if appleTree.contains(touch.location(in: self)) {
            run(gMajSound)
        }
        
        if bananaTree.contains(touch.location(in: self)) {
            run(pianoSound)
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

