//
//  Menuscene.swift
//  MusicOrchard
//
//  Created by Jingyao Gu on 4/10/20.
//  Copyright © 2020 Benjamin Blomquist. All rights reserved.
//

import SpriteKit

class Menuscene: SKScene {
    
    var newGameButtonNode: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        newGameButtonNode = self.childNode(withName: "newGameButton") as? SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        if let location = touch?.location(in: self){
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "newGameButton"{
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let gameScene = GameScene(size: self.size)
                self.view?.presentScene(gameScene, transition: transition)
            }
        }
    }

}
