//
//  SceneKitView.swift
//  Kix
//
//  Created by Obed Willhem on 18/05/23.
//

import SwiftUI
import SceneKit

struct SceneKitView: UIViewRepresentable {
  
  @Binding var scene : SCNScene?
  
  func makeUIView(context: Context) -> SCNView {
    
    let view = SCNView()
    view.allowsCameraControl = true
    view.autoenablesDefaultLighting = true
    view.antialiasingMode = .multisampling2X
    view.scene = scene
    view.backgroundColor = .clear
    view.pointOfView = view.scene!.rootNode.childNode(withName: "camera3", recursively: true)
    SCNTransaction.begin()
    SCNTransaction.animationDuration = 3
    view.pointOfView = view.scene!.rootNode.childNode(withName: "camera2", recursively: true)
    SCNTransaction.commit()
    
//    scene?.lightingEnvironment.contents = "cloud.hdr"
    
//    view.showsStatistics = true
    view.cameraControlConfiguration.rotationSensitivity = 0.3
    
    return view
  }
  
  func updateUIView(_ uiView: SCNView, context: Context) {
    // update buat ke view
  }
}

struct SceneKitView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
