//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import SceneKit


//SCNNode: position, scale, orientation
//SCNGeometry: defines visible content inside the node


class MyViewController : UIViewController {
    
    var sceneView: SCNView!
    
    override func loadView() {
        
        sceneView = SCNView(frame: CGRect(x: 0.0, y: 0.0, width: 500, height: 600))
        sceneView.backgroundColor = UIColor.black
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
        cameraNode.camera!.automaticallyAdjustsZRange = true
        cameraNode.position = SCNVector3Make(35, 40, -50)
        cameraNode.eulerAngles = SCNVector3Make(-.pi/5, (5 * .pi/6), 0)
        
        scene.rootNode.addChildNode(cameraNode)

        
        
        //Geometry: Floor - default reflectivity 0.25
        let floorGeo = SCNFloor()
        floorGeo.firstMaterial!.diffuse.contents = UIColor.black
        
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
        cylinderNode.position = SCNVector3Make(-20, 5, 0)
        cylinderNode.name = "cylinder"
        
        scene.rootNode.addChildNode(cylinderNode)
        
        
        
        //Geometry: Plane - only visible on one side?
        let planeGeo = SCNPlane(width: 10.0, height: 10.0)
        planeGeo.firstMaterial!.diffuse.contents = UIColor.green
        
        let planeNode = SCNNode(geometry: planeGeo)
        planeNode.position = SCNVector3Make(20, 5, 30)
        planeNode.eulerAngles.y = .pi
        planeNode.name = "plane"
        
        scene.rootNode.addChildNode(planeNode)
        
        
        
        //Geometry: Pyramid - position y anchor is at the base
        let pyramidGeo = SCNPyramid(width: 10.0, height: 10.0, length: 10.0)
        pyramidGeo.firstMaterial!.diffuse.contents = UIColor.magenta
        
        let pyramidNode = SCNNode(geometry: pyramidGeo)
        pyramidNode.position = SCNVector3Make(20, 0, 0)
        
        scene.rootNode.addChildNode(pyramidNode)
            
            
            
        //Geometry: Sphere
        let sphereGeo = SCNSphere(radius: 5.0)
        sphereGeo.firstMaterial!.diffuse.contents = UIColor.orange
        
        let sphereNode = SCNNode(geometry: sphereGeo)
        sphereNode.position = SCNVector3Make(20, 5, 15)
        sphereNode.name = "sphere"
        
        scene.rootNode.addChildNode(sphereNode)
        
        
        
        //Geometry: Torus - ring = center to edge, pipe = tube radius
        let torusGeo = SCNTorus(ringRadius: 7.0, pipeRadius: 5.0)
        torusGeo.firstMaterial!.diffuse.contents = UIColor.purple
        
        let torusNode = SCNNode(geometry: torusGeo)
        torusNode.position = SCNVector3Make(-20, 5, 35)
        torusNode.name = "torus"
        
        scene.rootNode.addChildNode(torusNode)
        
        
        
        //Geometry: Tube
        let tubeGeo = SCNTube(innerRadius: 3.0, outerRadius: 5.0, height: 10.0)
        tubeGeo.firstMaterial!.diffuse.contents = UIColor.yellow
        
        let tubeNode = SCNNode(geometry: tubeGeo)
        tubeNode.position = SCNVector3Make(-20, 5, 15)
        tubeNode.name = "tube"
        
        scene.rootNode.addChildNode(tubeNode)
        
        
        
        //Geometry: Text
        let textGeo = SCNText(string: "Hello World!", extrusionDepth: 5.0)
        textGeo.firstMaterial!.diffuse.contents = UIColor.white
        
        
        let textNode = SCNNode(geometry: textGeo)
        textNode.position = SCNVector3Make(15, 15, 20)
        textNode.eulerAngles.y = .pi
        textNode.scale = SCNVector3Make(0.5, 0.5, 0.5)
        textNode.name = "text"
        
        scene.rootNode.addChildNode(textNode)
        
        
        //Geometry: Shape
        
        //let shapeGeo = SCNShape(path: <#T##UIBezierPath?#>, extrusionDepth: <#T##CGFloat#>)
        
        sceneView.scene = scene
        
    }
   
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()




