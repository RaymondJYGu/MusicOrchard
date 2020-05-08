//
//  Fruit.swift
//  MusicOrchard
//
//  Created by Chenxin Zhu on 4/23/20.
//  Copyright © 2020 Benjamin Blomquist. All rights reserved.
//

import Foundation
import SpriteKit

class Fruit : SKSpriteNode{
    var xPosition: Double
    var yPosition: Double
    weak var tree: Tree?
    var spot: Spot? = nil
    var instrument: String
    var isPlaying = false

    init(image: String, instrument: String) {
        let texture = SKTexture(imageNamed: image)
        self.tree = nil
        self.xPosition = 0
        self.yPosition = 0
        self.instrument = instrument
        super.init(texture: texture, color: .clear, size: texture.size())
        isUserInteractionEnabled = true
        setPosition(xPosition: xPosition, yPosition: yPosition)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPosition(xPosition: Double, yPosition: Double) {
        self.xPosition = xPosition
        self.yPosition = yPosition
        position = CGPoint(x: xPosition, y: yPosition)
    }
    
    func grow() {
        setScale(0)
        zRotation = CGFloat(Double.random(in: -Double.pi/4...Double.pi/4))
        let scale = SKAction.sequence([
            SKAction.scale(to: GameScene.imageScale * 0.9, duration: 1),
            SKAction.scale(to: GameScene.imageScale * 0.8, duration: 0.2),
            ])
        run(scale)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        play()
    }
    
    func play() {
        if isPlaying {
            return
        }
        isPlaying = true
        let lightswitch = SKAction.repeatForever(
            SKAction.sequence([
                SKAction.colorize(with: UIColor.gray, colorBlendFactor: 0.1, duration: 0.5),
                SKAction.colorize(with: UIColor.white, colorBlendFactor: 0.1, duration: 0.5)]))
        let vibration = SKAction.repeatForever(
            SKAction.sequence([
                SKAction.rotate(byAngle: -0.2, duration: 0.1),
                SKAction.rotate(byAngle: 0.2, duration: 0.1)]))
        run(lightswitch, withKey: "lightswitch")
        run(vibration, withKey: "vibration")
        run(SKAction.repeat(Rhythm.generateRandomRhythm(instrument: self.instrument, numOfNotes: 3), count: 3)) {
            self.removeAction(forKey: "vibration")
            self.removeAction(forKey: "lightswitch")
            self.run(SKAction.colorize(withColorBlendFactor: 0, duration: 0.1))
            let falling = SKAction.moveBy(x: 0, y: -500, duration: 0.5)
            falling.timingMode = .easeIn
            self.run(falling){
                self.run(SKAction.fadeOut(withDuration: 0.5)) {
                    self.isPlaying = false
                    self.tree?.deleteFruit(fruit: self)
                }
            }
        }
    }
}
