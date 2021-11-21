//
//  SpriteKitView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 21.11.2021.



//1. We need to import SpriteKit
import SpriteKit
import SwiftUI


//2. We create a game class that inherits SKscene
class GameScene : SKScene {
    override func didMove(to view: SKView) {
        //3. Here we need to set up the character
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //4. We initialize the first touch on the screen
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        //5. After the user touches the screen a new red box is created at this location
        let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        
        //6. Here we set up the location of the box and its body
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        
        //7. DON'T forget to add the character to the GameScene
        addChild(box)

    }
}

struct SpriteKitView: View {
    
    //8. ADD the size if the game is not created using SKFile
    var scene : SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .fill
        return scene
    }

     
    var body: some View {
        SpriteView(scene: scene).frame(width: 300, height: 400)
        
        
        
    }
}

struct SpriteKitView_Previews: PreviewProvider {
    static var previews: some View {
        SpriteKitView()
    }
}
