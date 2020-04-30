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

        // playing around with SKAction sequencing
//        let vocalShortA = SKAction.playSoundFileNamed("voice - short a", waitForCompletion: false)
//        let vocalShortD = SKAction.playSoundFileNamed("voice - short d", waitForCompletion: false)
//        let vocalShortG = SKAction.playSoundFileNamed("voice - short g", waitForCompletion: false)
//        let celloShortA = SKAction.playSoundFileNamed("cello - short a", waitForCompletion: false)
//        let celloShortC = SKAction.playSoundFileNamed("cello - short c", waitForCompletion: false)
//        let celloShortE = SKAction.playSoundFileNamed("cello - short e", waitForCompletion: false)
//        let trumpetShortD = SKAction.playSoundFileNamed("trumpet - short d", waitForCompletion: false)
//        let trumpetShortA = SKAction.playSoundFileNamed("trumpet - short a", waitForCompletion: false)
//        let wait = SKAction.wait(forDuration: 1)
//        let wait2 = SKAction.wait(forDuration: 2)
        
        //        this works right now! a couple different variations on what sequences could be
//        if appleTree.contains(touch.location(in: self)) {
//            run(
//                SKAction.repeat(
//                    SKAction.sequence([
//                        SKAction.note(instrument: "voice", note: "a", duration: 0.4),
//                        SKAction.note(instrument: "voice", note: "d", duration: 0.2),
//                        SKAction.note(instrument: "voice", note: "d", duration: 0.2),
//                        SKAction.note(instrument: "voice", note: "d", duration: 0.2),
//                    ]),
//                    count: 5
//                )
//            );
//        }
        
        if lemonTree.contains(touch.location(in: self)) {
            run(SKAction.sequence([celloShortA, wait, celloShortC, celloShortE]))
        }
        if bananaTree.contains(touch.location(in: self)) {
            run(SKAction.sequence([trumpetShortA, trumpetShortD, wait, trumpetShortD]))
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

extension SKAction {
    static func note(instrument: String, note: String, duration: TimeInterval) -> SKAction {
        SKAction.sequence([
            SKAction.playSoundFileNamed(
                "\(instrument) - short \(note)",
                waitForCompletion: false),
            SKAction.wait(forDuration: duration)
        ])
    }
    
    // You might end up writing other SKAction music methods like this:
    //
    // let appleRhythm = SKAction.rhythm(instrument: "voice", length: 5, pulse: 0.1)

}
