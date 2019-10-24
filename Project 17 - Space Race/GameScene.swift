//
//  GameScene.swift
//  Project 17 - Space Race
//
//  Created by Sean Williams on 24/10/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var starfield: SKEmitterNode!
    var player: SKSpriteNode!

    var scoreLabel: SKLabelNode!
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = .black

          starfield = SKEmitterNode(fileNamed: "starfield")!
          starfield.position = CGPoint(x: 1024, y: 384)
          starfield.advanceSimulationTime(10)
          addChild(starfield)
          starfield.zPosition = -1

          player = SKSpriteNode(imageNamed: "player")
          player.position = CGPoint(x: 100, y: 384)
          player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.size)
          player.physicsBody?.contactTestBitMask = 1
          addChild(player)

          scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
          scoreLabel.position = CGPoint(x: 16, y: 16)
          scoreLabel.horizontalAlignmentMode = .left
          addChild(scoreLabel)

          score = 0

          physicsWorld.gravity = CGVector(dx: 0, dy: 0)
          physicsWorld.contactDelegate = self
    }
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
