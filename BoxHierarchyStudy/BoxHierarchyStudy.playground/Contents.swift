//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import SceneKit
class MyViewController : UIViewController {
    
    var sceneView: SCNView!
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .black
        sceneView = SCNView(frame: CGRect(x: 0.0, y: 0.0, width: 500, height: 600))
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        self.view = sceneView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sceneSetup()
    }
    
    func sceneSetup() {
        let scene = SCNScene()

        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 5, 30)
        scene.rootNode.addChildNode(cameraNode)

        
        let boxGeo = SCNBox(width: 10.0, height: 10.0, length: 10.0, chamferRadius: 1.0)
        boxGeo.firstMaterial!.diffuse.contents = UIColor.red
        let boxNode = SCNNode(geometry: boxGeo)
        boxNode.position = SCNVector3Make(0, 0, 0)
        boxNode.opacity = 0.4
        boxNode.castsShadow = true
        boxNode.name = "testing"
        //coodinates generated based on the root node
        let miniBox = boxNode.copy() as! SCNNode
        miniBox.scale = SCNVector3Make(0.4, 0.4, 0.4)
        miniBox.opacity = 1.0
        miniBox.moveBy(x: 0, y: 15, z: 0)
        boxNode.addChildNode(miniBox)
        
        let miniBoxMoved = boxNode.copy() as! SCNNode
        miniBoxMoved.scale = SCNVector3Make(0.4, 0.4, 0.4)
        miniBoxMoved.opacity = 1.0
        miniBoxMoved.moveBy(x: 3.0, y: 2.0, z: -5.0)
        boxNode.addChildNode(miniBoxMoved)

        scene.rootNode.addChildNode(boxNode)
        
        sceneView.scene = scene
    }
   
}

extension SCNNode {
    func moveBy(x: Float, y: Float, z: Float) {
        self.position.x += x
        self.position.y += y
        self.position.z += z
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()




