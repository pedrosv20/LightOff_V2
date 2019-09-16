//
//  Quarto.swift
//  LightOff_V2
//
//  Created by Pedro Vargas on 16/09/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import SpriteKit

class Room {
    
    static var roomBackgrounds: [String] = ["room1", "room2"]
    
    var scene: GameScene!
    var backgroundNode: SKSpriteNode
    var lightOff = SKSpriteNode(imageNamed: "lightOff")
    var isOn: Bool
    var nextSelfToggle: Timer?
    var toggledError = false
    var limitToLose = 3
    
    
    init(backgroundName: String, isOn: Bool, size: CGSize, posInScene: CGPoint) {
        self.backgroundNode = SKSpriteNode(imageNamed: backgroundName)
        self.backgroundNode.size = size
        self.backgroundNode.position = posInScene
        
        self.lightOff.size = size
        self.lightOff.isHidden = true
        self.lightOff.zPosition = 100
        self.backgroundNode.addChild(lightOff)
        
        
        
        self.isOn = isOn
        
    }
    
    
    func toggleRoom() {
        //TODO: separar em mais funcs
        
        if isOn {
            scene.sound(isOn: isOn)
            // cria novo timer, desliga
            backgroundNode.colorBlendFactor = CGFloat(1)
            isOn = false
            lightOff.isHidden = false
            
            print("desligou na raça")
            
            
            toggledError = true
            self.nextSelfToggle = Timer.scheduledTimer(withTimeInterval: TimeInterval(Double.random(in: 0.3..<1)), repeats: false) { (Timer) in
                self.toggledError = false
                self.toggleRoom()
                
                print("ligou sozinho")
            }
            
        } else {
            print("liga")
            
            
            // para verificar se perdeu
//            if !toggledError {
//                backgroundNode.color = .white
//            } else {
//
//                limitToLose -= 1
//                if limitToLose <= 0 {
//                    print("perdeu")
//                }
//                backgroundNode.color = .red
//            }
            
            backgroundNode.colorBlendFactor = CGFloat(1)
            scene.sound(isOn: isOn)
            self.nextSelfToggle?.invalidate()
            isOn = true 
            // invalida timer hey
            
            lightOff.isHidden = true
            
        }
    }
    
}
