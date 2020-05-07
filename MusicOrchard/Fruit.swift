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
        let scale = SKAction.scale(to: GameScene.imageScale * 0.8, duration: 5)
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
        let vibration = SKAction.repeatForever(
            SKAction.sequence([
                SKAction.rotate(toAngle: -0.2, duration: 0.1),
                SKAction.rotate(toAngle: 0.2, duration: 0.1)]))
        run(vibration, withKey: "vibration")
        run(SKAction.repeat(Rhythm.generateRandomRhythm(instrument: self.instrument, numOfNotes: Int.random(in: 2...3)), count: Int.random(in: 2...4))) {
            self.removeAction(forKey: "vibration")
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
