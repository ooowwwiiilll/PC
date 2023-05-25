//
//  SwiftUIView2.swift
//  Kix
//
//  Created by Obed Willhem on 25/05/23.
//

import SwiftUI
import SceneKit

struct SwiftUIView2: View {
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

struct SceneKitView2: UIViewRepresentable {
  
  @Binding var scene : SCNScene?
  
  func makeUIView(context: Context) -> SCNView {
    
    let view = SCNView()
    view.allowsCameraControl = true
    view.autoenablesDefaultLighting = true
    view.antialiasingMode = .multisampling2X
    view.scene = scene
    //    view.scene?.background.contents = "cloud.hdr"
//    view.pointOfView = view.scene!.rootNode.childNode(withName: "camera4", recursively: true)
//    SCNTransaction.begin()
//    SCNTransaction.animationDuration = 6
    view.pointOfView = view.scene!.rootNode.childNode(withName: "camera5", recursively: true)
//    SCNTransaction.commit()
    
    let rotationAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 2))
    scene!.rootNode.runAction(rotationAction)
    //    scene?.lightingEnvironment.contents = "cloud.hdr"
    
    view.showsStatistics = true
    view.cameraControlConfiguration.rotationSensitivity = 0.6
    
    return view
  }
  
  func updateUIView(_ uiView: SCNView, context: Context) {
    // update buat ke view
  }
}

//struct SwiftUIView2_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView2()
//    }
//}
