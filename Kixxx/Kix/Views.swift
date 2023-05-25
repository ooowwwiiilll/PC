//
//  Views.swift
//  Kix
//
//  Created by Obed Willhem on 24/05/23.
//

import SwiftUI
import SceneKit
import AudioToolbox

struct Intro: View {
  
  var body: some View {
    NavigationStack {
      ZStack {
//        Color.black.opacity(0.7)
//          .edgesIgnoringSafeArea(.all)
        ZStack {
          TextView()
            .edgesIgnoringSafeArea(.all)
//            .blendMode(.lighten)
          VStack {
            Spacer().frame(height: UIScreen.main.bounds.height / 12)
            Text("DRAG ME\n\n")
              .foregroundColor(.white.opacity(0.3)).fontDesign(.monospaced).kerning(-0.5)
            Spacer().frame(height: UIScreen.main.bounds.height / 4)
            NavigationLink {
              ContentView()
            } label: {
              ZStack {
                Text("START")
                  .foregroundColor(.white).fontDesign(.monospaced).kerning(-0.5).shadow(color: .white.opacity(1), radius: 12).fontWeight(.bold)
                Text("START")
                  .foregroundColor(.white).fontDesign(.monospaced).kerning(-0.5).shadow(color: .white.opacity(0.5), radius: 6).fontWeight(.bold)
              }
            }
          }
        }
      }
      .navigationTitle("")
    }
  }
}

struct TextView: UIViewRepresentable {
  
  @State var index = 0
  let sceneView = SCNView()
  
  func makeUIView(context: Context) -> SCNView {
    sceneView.scene = SCNScene(named: "text2.scn")
    sceneView.autoenablesDefaultLighting = true
    sceneView.allowsCameraControl = true
    sceneView.backgroundColor = UIColor.darkGray
    
    
    let scale = 0.45
    sceneView.scene?.rootNode.scale = SCNVector3(scale, scale, scale)
    
    let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handlePanGesture(_:)))
    sceneView.addGestureRecognizer(panGesture)
    
    return sceneView
  }
  
  func updateUIView(_ uiView: SCNView, context: Context) {}
  
  func makeCoordinator() -> Coordinator {
    Coordinator()
  }
  
  class Coordinator: NSObject {
    @objc func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
      guard let sceneView = gestureRecognizer.view as? SCNView else { return }
      
      switch gestureRecognizer.state {
      case .changed:
        let translation = gestureRecognizer.translation(in: sceneView)
        
        // Adjust rotation based on gesture translation
        let rotationX = SCNAction.rotateBy(x: 0.01 * translation.y, y: 0, z: 0, duration: 0)
        let rotationY = SCNAction.rotateBy(x: 0, y: 0.01 * translation.x, z: 0, duration: 0)
        let rotationSequence = SCNAction.sequence([rotationX, rotationY])
        sceneView.scene?.rootNode.runAction(rotationSequence)
        
        // Reset gesture translation
        gestureRecognizer.setTranslation(.zero, in: sceneView)
        
      case .ended, .cancelled:
        // Bounce back to original orientation
        let originalRotation = SCNAction.rotateTo(x: 0, y: 0, z: 0, duration: 0.5)
        let bounceBack = SCNAction.sequence([originalRotation, originalRotation.reversed()])
        sceneView.scene?.rootNode.runAction(bounceBack)
        
      default:
        break
      }
    }
  }
}


struct Intro_Previews: PreviewProvider {
  static var previews: some View {
    Intro()
  }
}

// PINDAH KE CONTENTVIEW LANGSUNG

