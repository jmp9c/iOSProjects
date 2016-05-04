//
//  GameScene.swift
//  Flappy Raider
//
//  Created by John Peden on 5/1/16.
//  Copyright (c) 2016 John Peden. All rights reserved.
//

import SpriteKit

struct PhysicsCategory {
  static let Ghost: UInt32 = 0x1 << 1
  static let Ground: UInt32 = 0x1 << 2
  static let Wall: UInt32 = 0x1 << 3
  static let Score: UInt32 = 0x1 << 4
  
}

class GameScene: SKScene, SKPhysicsContactDelegate {
  
  var Ground = SKSpriteNode()
  var Ghost = SKSpriteNode()
  var wallPair = SKNode()
  var moveAndRemove = SKAction()
  var gameStarted = Bool()
  var Score =  Int()
  let scoreLabel = SKLabelNode()
  var died = Bool()
  var restartButton = SKSpriteNode()
  
  func restartScene() {
    self.removeAllChildren()
    self.removeAllActions()
    died = false
    gameStarted = false
    Score = 0
    createScene()
  }
  
  func createScene() {
    self.physicsWorld.contactDelegate = self
    self.scene?.backgroundColor = UIColor(red: 0/255, green: 102/255, blue: 204/255, alpha: 1)
    
    scoreLabel.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + self.frame.height / 2.5)
    scoreLabel.text = "\(Score)"
    scoreLabel.fontName = "04b_19"
    scoreLabel.fontSize = 60
    self.addChild(scoreLabel)
    scoreLabel.zPosition = 5
    
    /* Make the Ground */
    Ground = SKSpriteNode(imageNamed: "Ground")
    Ground.setScale(0.5)
    Ground.position = CGPoint(x: self.frame.width / 2, y: 0 + Ground.frame.height / 2)
    
    /* Make ground physics */
    Ground.physicsBody = SKPhysicsBody(rectangleOfSize: Ground.size)
    Ground.physicsBody?.categoryBitMask = PhysicsCategory.Ground
    Ground.physicsBody?.collisionBitMask = PhysicsCategory.Ghost
    Ground.physicsBody?.contactTestBitMask = PhysicsCategory.Ghost
    Ground.physicsBody?.affectedByGravity = false
    Ground.physicsBody?.dynamic = false
    Ground.zPosition = 3
    self.addChild(Ground)
    
    /* Make a ghost */
    Ghost = SKSpriteNode(imageNamed: "Lightning")
    Ghost.size = CGSize(width: 80, height: 90)
    Ghost.position = CGPoint(x: self.frame.width / 2 - Ghost.frame.width, y: self.frame.height / 2)
    
    // Undo to flip lightning upside down
    //Ghost.zRotation = CGFloat(M_PI)
    
    /* Ghost physics */
    let lightningSize = CGSize(width: 80, height: 22)
    Ghost.physicsBody = SKPhysicsBody(rectangleOfSize: lightningSize)
    Ghost.physicsBody?.categoryBitMask = PhysicsCategory.Ghost
    Ghost.physicsBody?.collisionBitMask = PhysicsCategory.Ground | PhysicsCategory.Wall
    Ghost.physicsBody?.contactTestBitMask = PhysicsCategory.Ground | PhysicsCategory.Wall | PhysicsCategory.Score
    Ghost.physicsBody?.affectedByGravity = false
    Ghost.physicsBody?.dynamic = true
    Ghost.zPosition = 2
    self.addChild(Ghost)
    
  }
  override func didMoveToView(view: SKView) {
    
    createScene()
    
  }
  
  func createButton() {
    restartButton = SKSpriteNode(imageNamed: "Restart")
    restartButton.size = CGSizeMake(200, 100)
    restartButton.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
    restartButton.zPosition = 6
    restartButton.setScale(0)
    self.addChild(restartButton)
    
    restartButton.runAction(SKAction.scaleTo(1.0, duration: 0.3))
  }
  
  func didBeginContact(contact: SKPhysicsContact) {
    let firstBody = contact.bodyA
    let secondBody = contact.bodyB
    
    
    if firstBody.categoryBitMask == PhysicsCategory.Score && secondBody.categoryBitMask == PhysicsCategory.Ghost || firstBody.categoryBitMask == PhysicsCategory.Ghost && secondBody.categoryBitMask == PhysicsCategory.Score {
      Score = Score + 1
      scoreLabel.text = "\(Score)"
    }
    
    if firstBody.categoryBitMask == PhysicsCategory.Ghost && secondBody.categoryBitMask == PhysicsCategory.Wall || firstBody.categoryBitMask == PhysicsCategory.Wall && secondBody.categoryBitMask == PhysicsCategory.Ghost {
      
      
      enumerateChildNodesWithName("wallPair", usingBlock: ({
        (node, error) in
        node.speed = 0
        self.removeAllActions()
      }))
      
      if died == false {
        died = true
        createButton()
      }
      
    }
    
    if firstBody.categoryBitMask == PhysicsCategory.Ghost && secondBody.categoryBitMask == PhysicsCategory.Ground || firstBody.categoryBitMask == PhysicsCategory.Ground && secondBody.categoryBitMask == PhysicsCategory.Ghost{
     
      
      
      enumerateChildNodesWithName("wallPair", usingBlock: ({
        (node, error) in
        node.speed = 0
        self.removeAllActions()
      }))
      
      if died == false {
        died = true
        createButton()
      }
      
    }
    
    
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    /* Called when a touch begins */
    if gameStarted == false {
      
      gameStarted = true
      Ghost.physicsBody?.affectedByGravity = true
      
      let spawn = SKAction.runBlock({
        () in
        self.createWalls()
      })
      
      let delay = SKAction.waitForDuration(2.0)
      let SpawnDelay = SKAction.sequence([spawn, delay])
      let spawnDelayForever = SKAction.repeatActionForever(SpawnDelay)
      self.runAction(spawnDelayForever)
      
      let distance = CGFloat(self.frame.width + wallPair.frame.width)
      let movePipes = SKAction.moveByX(-distance, y: 0, duration: NSTimeInterval(0.01 * distance))
      let removePipes = SKAction.removeFromParent()
      moveAndRemove = SKAction.sequence([movePipes, removePipes])
      
      Ghost.physicsBody?.velocity = CGVectorMake(0, 0)
      Ghost.physicsBody?.applyImpulse(CGVectorMake(0, 50))
      
    } else {
      
      if died == true {
        
      } else {
        Ghost.physicsBody?.velocity = CGVectorMake(0, 0)
        Ghost.physicsBody?.applyImpulse(CGVectorMake(0, 50))
      }
    }
    
    
    for touch in touches {
      let location = touch.locationInNode(self)
      if died == true {
        if restartButton.containsPoint(location) {
          restartScene()
        }
        
      }
    }
    
  }
  
  override func update(currentTime: CFTimeInterval) {
    /* Called before each frame is rendered */
  }
  
  func createWalls(){
    wallPair = SKNode()
    wallPair.name = "wallPair"
    let scoreNode = SKSpriteNode()
    scoreNode.size = CGSize(width: 1, height: 200)
    scoreNode.position = CGPoint(x: self.frame.width, y: self.frame.height / 2)
    scoreNode.physicsBody = SKPhysicsBody(rectangleOfSize: scoreNode.size)
    scoreNode.physicsBody?.affectedByGravity = false
    scoreNode.physicsBody?.dynamic = false
    scoreNode.physicsBody?.categoryBitMask = PhysicsCategory.Score
    scoreNode.physicsBody?.collisionBitMask = 0
    scoreNode.physicsBody?.contactTestBitMask = PhysicsCategory.Ghost
    //scoreNode.color = SKColor.blueColor()
    
    let topWall = SKSpriteNode(imageNamed: "column")
    let bottomWall = SKSpriteNode(imageNamed: "column")
    
    topWall.position = CGPoint(x: self.frame.width, y: self.frame.height / 2 + 360)
    bottomWall.position = CGPoint(x: self.frame.width, y: self.frame.height / 2 - 360)
    
    topWall.setScale(0.5)
    bottomWall.setScale(0.5)
    
    topWall.physicsBody = SKPhysicsBody(rectangleOfSize: topWall.size)
    topWall.physicsBody?.categoryBitMask = PhysicsCategory.Wall
    topWall.physicsBody?.collisionBitMask = PhysicsCategory.Ghost
    topWall.physicsBody?.contactTestBitMask = PhysicsCategory.Ghost
    topWall.physicsBody?.dynamic = false
    topWall.physicsBody?.affectedByGravity = false
    
    bottomWall.physicsBody = SKPhysicsBody(rectangleOfSize: topWall.size)
    bottomWall.physicsBody?.categoryBitMask = PhysicsCategory.Wall
    bottomWall.physicsBody?.collisionBitMask = PhysicsCategory.Ghost
    bottomWall.physicsBody?.contactTestBitMask = PhysicsCategory.Ghost
    bottomWall.physicsBody?.dynamic = false
    bottomWall.physicsBody?.affectedByGravity = false
    
    topWall.zRotation = CGFloat(M_PI)
    
    
    wallPair.addChild(topWall)
    wallPair.addChild(bottomWall)
    
    wallPair.zPosition = 1
    let RandomPosition = CGFloat.random(min: -200, max: 200)
    wallPair.position.y = wallPair.position.y + RandomPosition
    wallPair.addChild(scoreNode)
    wallPair.runAction(moveAndRemove)
    self.addChild(wallPair)
    
  }
}
