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
    
    var appleTree = Tree(filename: "appleTree")
    var apple = Fruit(filename: "apple")
    var apple2 = Fruit(filename: "apple")
    
    var bananaTree = Tree(filename: "bananaTree")
    var banana = Fruit(filename: "banana")
    var banana2 = Fruit(filename: "banana")
    
    var coconutTree = Tree(filename: "coconutTree")
    var coconut = Fruit(filename: "coconut")
    var coconut2 = Fruit(filename: "coconut")
    
    var lemonTree = Tree(filename: "coconutTree")
    var lemon = Fruit(filename: "lemon")
    var lemon2 = Fruit(filename: "lemon")
    
    var peachTree = Tree(filename: "peachTree")
    var peach = Fruit(filename: "peach")
    var peach2 = Fruit(filename: "peach")
    
    

    
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
        
        if appleTree.node.contains(touch.location(in: apple.node)) {
            run(Rhythm.generateRandomRhythm(instrument: "voice", numOfNotes: 5)) {
                self.appleTree.deleteFruit(fruit: self.apple)
            }
        }
        if appleTree.node.contains(touch.location(in: apple2.node)) {
            run(Rhythm.generateRandomRhythm(instrument: "voice", numOfNotes: 5)) {
                self.appleTree.deleteFruit(fruit: self.apple)
            }
        }
        
        if bananaTree.node.contains(touch.location(in: banana.node)) {
            run(Rhythm.generateRandomRhythm(instrument: "banjo", numOfNotes: 5)) {
                self.bananaTree.deleteFruit(fruit: self.banana)
            }
        }
        if bananaTree.node.contains(touch.location(in: banana2.node)) {
            run(Rhythm.generateRandomRhythm(instrument: "banjo", numOfNotes: 5)) {
                self.bananaTree.deleteFruit(fruit: self.banana)
            }
        }
        
        if coconutTree.node.contains(touch.location(in: coconut.node) ) {
            run(Rhythm.generateRandomRhythm(instrument: "cello", numOfNotes: 5)) {
                self.coconutTree.deleteFruit(fruit: self.coconut)
            }
        }
        if coconutTree.node.contains(touch.location(in: coconut2.node) ) {
            run(Rhythm.generateRandomRhythm(instrument: "cello", numOfNotes: 5)) {
                self.coconutTree.deleteFruit(fruit: self.coconut2)
            }
        }
        
        if lemonTree.node.contains(touch.location(in: lemon.node)) {
            run(Rhythm.generateRandomRhythm(instrument: "sax", numOfNotes: 5)) {
                self.lemonTree.deleteFruit(fruit: self.lemon)
            }
        }
        if lemonTree.node.contains(touch.location(in: lemon2.node)) {
            run(Rhythm.generateRandomRhythm(instrument: "sax", numOfNotes: 5)) {
                self.lemonTree.deleteFruit(fruit: self.lemon)
            }
        }
        
        if peachTree.node.contains(touch.location(in: peach.node)) {
            run(Rhythm.generateRandomRhythm(instrument: "trumpet", numOfNotes: 5)) {
                self.peachTree.deleteFruit(fruit: self.peach)
            }
        }
        if peachTree.node.contains(touch.location(in: peach2.node)) {
            run(Rhythm.generateRandomRhythm(instrument: "trumpet", numOfNotes: 5)) {
                self.peachTree.deleteFruit(fruit: self.peach)
            }
        }

        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

    // You might end up writing other SKAction music methods like this:
    //
    // let appleRhythm = SKAction.rhythm(instrument: "voice", length: 5, pulse: 0.1)


