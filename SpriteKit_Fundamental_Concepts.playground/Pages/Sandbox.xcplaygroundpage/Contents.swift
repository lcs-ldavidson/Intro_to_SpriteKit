//: [Previous](@previous)
/*:
 # Sandbox
 
 In this sandbox, let's break down what's happening to create this partial animation of the "nyan cat".
 
 Below, we import some required libraries.
 */
import Foundation
import SpriteKit
import PlaygroundSupport

//: Define a frame to draw upon (kind of like creating a canvas from earlier this year).
let frame = CGRect(x: 0, y: 0, width: 320, height: 256)

//: Define the midpoint of the frame
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

//: Create a scene that will render our animation.
//: Notice that the size of the scene is taken from the `frame` defined earlier.
var scene = SKScene(size: frame.size)

//: Create an instance of the SKSpriteNode class using the Nyancat image.
let nyanCat = SKSpriteNode(imageNamed: "Nyancat")
nyanCat.position = midPoint
nyanCat.setScale(8.0)

//adding Luma
let luma = SKSpriteNode (imageNamed: "LumaSprite")
luma.position = CGPoint(x: frame.size.width / 2 - 100, y: frame.size.height / 2.0 + 10)
luma.setScale(0.18)
scene.addChild(luma)
//: To show how happy Nyan Cat is, let's run an action that repeats a sequence of Nyan Cat going up and down forever.
let actionMoveUp = SKAction.moveBy(x: 0, y: 50, duration: 0.15)
let actionMoveDown = SKAction.moveBy(x: 0, y: -50, duration: 0.15)
let actionRotate = SKAction.rotate(byAngle: -15.5, duration: 1.25)
let actionRotateReverse = SKAction.rotate(byAngle: 15.5, duration: 1.25)
let actionMoveRight = SKAction.moveBy(x: 50, y: 0, duration: 0.15)
let actionMoveleft = SKAction.moveBy(x: -50, y: 0, duration: 0.15)
let actionSequence = SKAction.sequence([actionMoveUp, actionRotate, actionMoveRight, actionRotate, actionMoveDown, actionRotateReverse, actionMoveleft, actionRotateReverse])
let actionRepeat = SKAction.repeatForever(actionSequence)
let actionMoveOffScreen = SKAction.moveBy(x: 200, y: 0, duration: 5)
nyanCat.run(actionRepeat)
nyanCat.run(actionMoveOffScreen)
luma.run(actionRepeat)
luma.zPosition = 10
nyanCat.zPosition = 10  // Ensure sprite is above background
scene.addChild(nyanCat) // Add to the scene

//: Now show the scene within an SKView instance in the live view area
let view = SKView(frame: frame)
view.presentScene(scene)
PlaygroundPage.current.liveView = view

//: [Next](@next)
