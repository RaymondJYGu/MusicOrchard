
//  TestScene.swift
//  MusicOrchard
//
//  Created by Chenxin Zhu on 5/3/20.
//  Copyright © 2020 Benjamin Blomquist. All rights reserved.


import Foundation
import SpriteKit
import GameplayKit

class TestScene: SKScene {
    
    //declare all variables
    var HomeButton = SKSpriteNode()
    
    let background = SKSpriteNode (imageNamed: "newstartingpage")
    let instruction = SKSpriteNode(texture: nil, color: UIColor.systemBlue, size: CGSize(width: 200, height: 200))

    
    override func didMove(to view: SKView) {
        //foo
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = -1
        
        addChild(background)
    
        instruction.position = CGPoint(x:-500, y: 300)
        instruction.zPosition = 1000
        addChild(instruction)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
    
        
        if instruction.contains(touch.location(in: self)) {
            //Click on the blue node, another node appears in the middle, SKActions of other nodes are paused.
//            appleTree.node.isPaused = true
//            let node = SKSpriteNode(color: UIColor.systemRed, size: CGSize(width: 100, height: 100))
//            node.position = CGPoint(x: frame.midX, y: frame.midY)
//            addChild(node)
            //Click on the blue node, move to GameScene.
            self.handleStartButtonClick()
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func handleStartButtonClick() {
      let transition = SKTransition.reveal(with: .down, duration: 0.75)
        let gameScene = GameScene(size: frame.size)
      gameScene.scaleMode = scaleMode
      view?.presentScene(gameScene, transition: transition)
    }
}


    
    // You might end up writing other SKAction music methods like this:
    //
    // let appleRhythm = SKAction.rhythm(instrument: "voice", length: 5, pulse: 0.1)



