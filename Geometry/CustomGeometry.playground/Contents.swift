
import UIKit
import PlaygroundSupport
import SceneKit


//Base Custom Code From: https://www.invasivecode.com/weblog/scenekit-tutorial-part-2/?doing_wp_cron=1521738279.2503750324249267578125

class MyViewController : UIViewController, SCNSceneRendererDelegate {
    
    var sceneView: SCNView!
    
    override func loadView() {
        
        sceneView = SCNView(frame: CGRect(x: 0.0, y: 0.0, width: 500, height: 600))
        sceneView.backgroundColor = UIColor.white
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        sceneView.delegate = self
        self.view = sceneView
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        glLineWidth(10)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sceneSetup()
    }
    
    func sceneSetup() {
        let scene = SCNScene()
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 0)
        
        scene.rootNode.addChildNode(cameraNode)
        
        //Geometry: Custom
        let customGeo = customGeometry()
        
        let customNode = SCNNode(geometry: customGeo)
        customNode.position = SCNVector3Make(0, 0, -20)
        //customNode.scale = SCNVector3Make(0.7, 0.7, 0.7)
        customNode.name = "custom"
        
        scene.rootNode.addChildNode(customNode)
        
        sceneView.scene = scene
        
    }
    
    func customGeometry() -> SCNGeometry {
        
        //changing the t gives you all kinds of different structures
        let t = (1.0 + sqrt(5.0)) / 2.0; // - this function creates a icosahedron
        
        let vertices: [SCNVector3] = [
            SCNVector3(-1,  t, 0), SCNVector3( 1,  t, 0), SCNVector3(-1, -t, 0), SCNVector3( 1, -t, 0),
            SCNVector3(0, -1,  t), SCNVector3(0,  1,  t), SCNVector3(0, -1, -t), SCNVector3(0,  1, -t),
            SCNVector3( t,  0, -1), SCNVector3( t,  0,  1), SCNVector3(-t,  0, -1), SCNVector3(-t,  0,  1) ]
        
        
        let data = NSData(bytes: vertices, length: MemoryLayout<SCNVector3>.size * vertices.count) as Data
        
        let vertexSource = SCNGeometrySource(data: data,
                                             semantic: .vertex,
                                             vectorCount: vertices.count,
                                             usesFloatComponents: true,
                                             componentsPerVector: 3,
                                             bytesPerComponent: MemoryLayout<Float>.size,
                                             dataOffset: 0,
                                             dataStride: MemoryLayout<SCNVector3>.stride)
        
        
        let indices: [Int32] = [
            0, 5, 1, 0, 1, 5, 1, 7, 1, 8, 1, 9, 2, 3, 2, 4, 2, 6, 2, 10, 2, 11, 3, 6, 3, 8, 3, 9, 4, 3, 4, 5,
            4, 9, 5, 9, 6, 7, 6, 8, 6, 10, 9, 8, 8, 7, 7, 0, 10, 0, 10, 7, 10, 11, 11, 0, 11, 4, 11, 5 ]
        
        let indexData = NSData(bytes: indices, length: MemoryLayout<Int32>.size * indices.count) as Data
        
        
        //changing primitiveType and primitiveCount results in all kinds of weird stuff
        let element = SCNGeometryElement(data: indexData,
                                         primitiveType: .line,
                                         primitiveCount: indices.count/2,
                                         bytesPerIndex: MemoryLayout<Int32>.size)
        
        //TODO: FIX COLORS VERTEX
        var vertexColors = [SCNVector3]()
    
        for _ in 0..<vertices.count {
            
            let red = Float(arc4random() % 255) / 255.0
            let green = Float(arc4random() % 255) / 255.0
            let blue = Float(arc4random() % 255) / 255.0
            print("\(red), \(blue), \(green)")
            vertexColors.append(SCNVector3(red, green, blue))
        }
        
        
        let dataColor = NSData(bytes: vertexColors, length: MemoryLayout<SCNVector3>.size * vertices.count) as Data
        
        let colors = SCNGeometrySource(data: dataColor,
                                       semantic: .color,
                                       vectorCount: vertexColors.count,
                                       usesFloatComponents: true,
                                       componentsPerVector: 3,
                                       bytesPerComponent: MemoryLayout<Float>.size,
                                       dataOffset: 0,
                                       dataStride: MemoryLayout<SCNVector3>.stride)
        
        return SCNGeometry(sources: [vertexSource, colors], elements: [element])
    }
    
   
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()




