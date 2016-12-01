//
//  GameScene.swift
//  Maze
//
//  Created by Finn Schaefer on 2/3/16.
//  Copyright (c) 2016 Archetapp. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate{
    let manager = CMMotionManager()
    var player = SKSpriteNode()
    var endNode = SKSpriteNode()
    var transistion:SKTransition = SKTransition.fade(withDuration: 1)
    
    override func didMove(to view: SKView){
        
        
        
        
        self.physicsWorld.contactDelegate = self
        
        player = self.childNode(withName: "player") as! SKSpriteNode
        endNode = self.childNode(withName: "endNode") as! SKSpriteNode
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdates(to: OperationQueue.main){
            (data, error) in
            
            self.physicsWorld.gravity = CGVector(dx: CGFloat((data?.acceleration.x)!) * 10, dy: CGFloat((data?.acceleration.y)!) * 10)
            
        }
        
    }
    

func didBegin(_ contact: SKPhysicsContact) {
    let bodyA = contact.bodyA
    let bodyB = contact.bodyB
    
    
    if bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2 || bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1{
        
            var _: SKSceneScaleMode
        
        
        if let nextScene = Level2(fileNamed: "Level2"){
            nextScene.scaleMode = self.scaleMode
            let transition = SKTransition.fade(withDuration: 1)
            view?.presentScene(nextScene, transition: transition)
        }
        return
            }
        }
    


        
    

    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        }
}
