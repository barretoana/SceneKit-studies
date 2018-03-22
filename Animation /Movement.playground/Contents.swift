//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import SceneKit

class MovementStudies: UIViewController, SCNSceneRendererDelegate {
    
    var sceneView: SCNView!
    
    override func loadView() {
        
        sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
        sceneView.backgroundColor = UIColor.white
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        sceneView.delegate = self
        self.view = sceneView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sceneSetup()
    }
    
    
    func sceneSetup() {
        
        let scene = SCNScene()
        
        //Camera Node
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.camera!.automaticallyAdjustsZRange = true
        cameraNode.position = SCNVector3Make(55, 55, 40)
        cameraNode.eulerAngles = SCNVector3Make(-.pi/4, .pi/4, 0)
        
        scene.rootNode.addChildNode(cameraNode)
        
        //Floor Node
        let floorGeo = SCNFloor()
        
        let floorNode = SCNNode(geometry: floorGeo)
        floorNode.position = SCNVector3Make(0, -10, 0)
        
        scene.rootNode.addChildNode(floorNode)
        
        //Box Node
        let boxGeo = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 0.1)
        boxGeo.firstMaterial!.diffuse.contents = UIColor.cyan
        
        let boxNode = SCNNode(geometry: boxGeo)
        boxNode.position = SCNVector3Make(0, 5, 0)
        boxNode.name = "move"
        scene.rootNode.addChildNode(boxNode)
        
        //Sphere Node
        let sphereGeo = SCNSphere(radius: 5)
        sphereGeo.firstMaterial!.diffuse.contents = UIColor.cyan
        
        let sphereNode = SCNNode(geometry: sphereGeo)
        sphereNode.position = SCNVector3Make(0, 5, -20)
        sphereNode.name = "pulse"
        scene.rootNode.addChildNode(sphereNode)
        
        //Cone Node
        let coneGeo = SCNCone(topRadius: 0, bottomRadius: 5, height: 10)
        coneGeo.firstMaterial!.diffuse.contents = UIColor.cyan
        
        let coneNode = SCNNode(geometry: coneGeo)
        coneNode.position = SCNVector3Make(0, 5, -40)
        coneNode.name = "squash"
        
        scene.rootNode.addChildNode(coneNode)
        
        sceneView.scene = scene
        
    }


    
    //Squash and Strech
    //change scale
    func squashAndStrech(node: SCNNode, x: Float, y: Float, z: Float) {
        node.scale.x = node.scale.x * x
        node.scale.y = node.scale.y * y
        node.scale.z = node.scale.z * z
    }
    
    //Pulse
    //change scale back and forth
    func pulse(node: SCNNode) {
        squashAndStrech(node: node, x: 1.1, y: 1.1, z: 1.1)
    }
    
    //Move
    //change position
    func move(node: SCNNode) {
        node.position.x += 1.0
        node.position.y += 1.0
        node.position.z += 1.0
    }
    
}

PlaygroundPage.current.liveView = MovementStudies()
PlaygroundPage.current.needsIndefiniteExecution = true
