//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import SceneKit
class MyViewController : UIViewController {
    
    var sceneView: SCNView!
    
    override func loadView() {
        
        sceneView = SCNView(frame: CGRect(x: 0.0, y: 0.0, width: 500, height: 600))
        sceneView.backgroundColor = UIColor.yellow
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
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
        cameraNode.position = SCNVector3Make(0, 70, 40)
        
        cameraNode.eulerAngles = SCNVector3Make(-.pi/3, 0.0, 0.0)
        scene.rootNode.addChildNode(cameraNode)

        
        
        //Geometry: Floor - default reflectivity 0.25
        let floorGeo = SCNFloor()
        let floorNode = SCNNode(geometry: floorGeo)
        floorNode.position = SCNVector3Make(0, 0, 0)
        floorNode.name = "floor"
        
        scene.rootNode.addChildNode(floorNode)
        
        
        
        //Geometry: Box
        let boxGeo = SCNBox(width: 10.0, height: 10.0, length: 10.0, chamferRadius: 0.5)
        boxGeo.firstMaterial!.diffuse.contents = UIColor.red
        let boxNode = SCNNode(geometry: boxGeo)
        boxNode.position = SCNVector3Make(0, 5, 0)
        boxNode.castsShadow = true
        boxNode.name = "box"

        scene.rootNode.addChildNode(boxNode)
        
        
        
        //Geometry: Capsule
        
        let capsuleGeo = SCNCapsule(capRadius: 3.0, height: 10.0)
        capsuleGeo.firstMaterial!.diffuse.contents = UIColor.blue
        let capsuleNode = SCNNode(geometry: capsuleGeo)
        capsuleNode.position = SCNVector3Make(0, 5, 15)
        capsuleNode.name = "capsule"
        
        scene.rootNode.addChildNode(capsuleNode)
        
        
        
        //Geometry: Cone
        
        let coneGeo = SCNCone(topRadius: 1.0, bottomRadius: 5.0, height: 10.0)
        coneGeo.firstMaterial!.diffuse.contents = UIColor.brown
        let coneNode = SCNNode(geometry: coneGeo)
        coneNode.position = SCNVector3Make(0, 5, 30)
        coneNode.name = "cone"
        
        scene.rootNode.addChildNode(coneNode)
        
        //Geometry: Cylinder
        
        let cylinderGeo = SCNCylinder(radius: 5.0, height: 10.0)
        cylinderGeo.firstMaterial!.diffuse.contents = UIColor.cyan
        let cylinderNode = SCNNode(geometry: cylinderGeo)
        cylinderNode.position = SCNVector3Make(0, 5, 45)
        cylinderNode.name = "cylinder"
        
        scene.rootNode.addChildNode(cylinderNode)
        
        //Geometry: Plane
        
        //Geometry: Pyramid
        
        //Geometry: Sphere
        
        //Geometry: Torus
        
        //Geometry: Tube
        
        //Geometry: Text
        
        //Geometry: Shape

        sceneView.scene = scene
    }
   
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()




