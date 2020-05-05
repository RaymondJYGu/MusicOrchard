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
        let scale = SKAction.scale(to: GameScene.imageScale, duration: 5)
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
                SKAction.rotate(toAngle: -0.15, duration: 0.1),
                SKAction.rotate(toAngle: 0.15, duration: 0.1)]))
        run(vibration, withKey: "vibration")
        run(Rhythm.generateRandomRhythm(instrument: self.instrument, numOfNotes: 5)) {
            self.removeAction(forKey: "vibration")
            self.isPlaying = false
            self.tree?.deleteFruit(fruit: self)
        }
    }
}
