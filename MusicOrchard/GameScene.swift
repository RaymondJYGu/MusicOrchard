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
    
    var appleTree = Tree(filename: "appleTree", width: 300, height: 300, xPosition: 0, yPosition: 0)
    var apple = Fruit(filename: "apple", width: 300, height: 300, xPosition: 0, yPosition: 0, musicName: "cello - medium a.wav")
    var apple2 = Fruit(filename: "apple", width: 300, height: 300, xPosition: 0, yPosition: 0, musicName: "cello - medium c.wav")
    
    var bananaTree = Tree(filename: "bananaTree", width: 300, height: 300, xPosition: 0, yPosition: 0)
    var banana = Fruit(filename: "banana", width: 300, height: 300, xPosition: 0, yPosition: 0, musicName: "cello - medium a.wav")
    var banana2 = Fruit(filename: "banana", width: 300, height: 300, xPosition: 0, yPosition: 0, musicName: "cello - medium c.wav")
    
    var coconutTree = Tree(filename: "coconutTree", width: 300, height: 300, xPosition: 0, yPosition: 0)
    var coconut = Fruit(filename: "coconut", width: 300, height: 300, xPosition: 0, yPosition: 0, musicName: "cello - medium a.wav")
    var coconut2 = Fruit(filename: "coconut", width: 300, height: 300, xPosition: 0, yPosition: 0, musicName: "cello - medium c.wav")
    
    var lemonTree = Tree(filename: "coconutTree", width: 300, height: 300, xPosition: 0, yPosition: 0)
    var lemon = Fruit(filename: "lemon", width: 300, height: 300, xPosition: 0, yPosition: 0, musicName: "cello - medium a.wav")
    var lemon2 = Fruit(filename: "lemon", width: 300, height: 300, xPosition: 0, yPosition: 0, musicName: "cello - medium c.wav")
    
    var peachTree = Tree(filename: "peachTree", width: 300, height: 300, xPosition: 0, yPosition: 0)
    var peach = Fruit(filename: "peach", width: 300, height: 300, xPosition: 0, yPosition: 0, musicName: "cello - medium a.wav")
    var peach2 = Fruit(filename: "peach", width: 300, height: 300, xPosition: 0, yPosition: 0, musicName: "cello - medium c.wav")
    
    

    
    override func didMove(to view: SKView) {
        //foo
        let background = SKSpriteNode (imageNamed: "farm bg")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = -1
        addChild(background)
        
        appleTree.addFruit(fruit: apple)
        appleTree.addFruit(fruit: apple2)
        appleTree.node.setScale(0.25)
        addChild(appleTree.node)
        appleTree.setPosition(xPosition: Double(frame.midX + 400), yPosition: Double(frame.midY - 100))
        
        bananaTree.addFruit(fruit: banana)
        bananaTree.addFruit(fruit: banana2)
        bananaTree.node.setScale(0.25)
        addChild(bananaTree.node)
        bananaTree.setPosition(xPosition: Double(frame.midX + 50), yPosition: Double(frame.midY - 150))
        
        coconutTree.addFruit(fruit: coconut)
        coconutTree.addFruit(fruit: coconut2)
        coconutTree.node.setScale(0.25)
        addChild(coconutTree.node)
        coconutTree.setPosition(xPosition: 300, yPosition: 200)
        
        lemonTree.addFruit(fruit: lemon)
        lemonTree.addFruit(fruit: lemon2)
        lemonTree.node.setScale(0.25)
        addChild(lemonTree.node)
        lemonTree.setPosition(xPosition: Double(frame.midX - 400), yPosition: Double(frame.midY + 100))
        
        peachTree.addFruit(fruit: peach)
        peachTree.addFruit(fruit: peach2)
        peachTree.node.setScale(0.25)
        addChild(peachTree.node)
        peachTree.setPosition(xPosition: -100, yPosition: 200)
        
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

        
        if appleTree.node.contains(touch.location(in: apple.node)) {
            run(
                SKAction.repeat(
                    SKAction.sequence([
                        SKAction.note(instrument: "voice", note: "a", duration: 0.4),
                        SKAction.note(instrument: "voice", note: "d", duration: 0.2),
                        SKAction.note(instrument: "voice", note: "d", duration: 0.2),
                        SKAction.note(instrument: "voice", note: "d", duration: 0.2),
                    ]),
                    count: 5
                )
            );
            appleTree.deleteFruit(fruit: apple, number: 0)
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
