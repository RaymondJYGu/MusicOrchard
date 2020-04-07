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
    var bombSoundEffect: AVAudioPlayer?
    var soundEffect: AVAudioPlayer?
    
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
        lemonTree.position = CGPoint(x: frame.midX + 250, y: frame.midY - 100)
        addChild(lemonTree)

        // Reenable this once sound files are in the project:

//        let path = Bundle.main.path(forResource: "bgm.mp3", ofType: nil)!
//        let url = URL(fileURLWithPath: path)
//
//        do {
//            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
//            bombSoundEffect?.play()
//        } catch {
//            // couldn't load file :(
//        }
        
        let path2 = Bundle.main.path(forResource: "Dog bark.wav", ofType: nil)!
        let url2 = URL(fileURLWithPath: path2)

        do {
            soundEffect = try AVAudioPlayer(contentsOf: url2)
            soundEffect?.play()
        } catch {
            // couldn't load file :(
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        if lemonTree.contains(touch.location(in: self)) {
            let path2 = Bundle.main.path(forResource: "Dog bark.wav", ofType: nil)!
            let url2 = URL(fileURLWithPath: path2)
            do {
                soundEffect = try AVAudioPlayer(contentsOf: url2)
                soundEffect?.play()
            } catch {
                // couldn't load file :(
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
            
            bananaTree.position.x = location.x
            bananaTree.position.y = location.y
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

