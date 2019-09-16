//
//  GameScene.swift
//  LightOff_V2
//
//  Created by Pedro Vargas on 12/09/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation



class GameScene: SKScene {
    
    var controller: GameViewController!
    
    var roomsList : [Room] = []
    
    let soundOn = SKAudioNode(fileNamed: "soundOn.mp3")
    let soundOff = SKAudioNode(fileNamed: "soundOff.mp3")
  
    
    
    
    override func didMove(to view: SKView) {
        
        createRooms(numberOfRooms: 4, size: CGSize(width: 100, height: 70))
        
        addRoomsInScene(rooms: roomsList)
  
        soundOn.autoplayLooped = false
        soundOff.autoplayLooped = false
        addChild(soundOff)
        addChild(soundOn)
        
    }
    
    func sound(isOn: Bool) {
        if isOn {
            self.soundOff.run(SKAction.play())
        } else {
            self.soundOn.run(SKAction.play())
        }
    }
    
    func addRoomsInScene (rooms: [Room]) {
        for room in rooms {
            room.scene = self
            addChild(room.backgroundNode)
        }
    }
    
    func createRooms(numberOfRooms: Int, size: CGSize) {
        for i in  0 ..< numberOfRooms {
            
            let room = Room(backgroundName: "background", isOn: true, size: CGSize(width: 150, height: 100), posInScene: CGPoint(x: i % 2 == 0 ? -100 : 100 , y: i - 1 <= 0 ? 0 : 200))
            roomsList.append(room)
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
    
        for i in roomsList {
            if i.backgroundNode.contains(pos) {
                i.toggleRoom()
            }
        }
    }
    
    func lightOff(node: SKShapeNode) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
