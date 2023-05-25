////
////  ARView.swift
////  Kix
////
////  Created by Obed Willhem on 25/05/23.
////
//
//import SwiftUI
//import RealityKit
//import SceneKit
//
//struct ARSceneView: View {
//  var body: some View {
//    ARViewContainer().edgesIgnoringSafeArea(.all)
//  }
//}
//
//struct ARViewContainer: UIViewRepresentable {
//   
//    func makeUIView(context: Context) -> ARView {
//       
//        let arView = ARView(frame: .zero)
//       
//        // Load the "Box" scene from the "Experience" Reality File
//
//        let boxAnchor = try! Experience2.loadBox()
//       
//        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
//       
//        return arView
//       
//    }
//   
//    func updateUIView(_ uiView: ARView, context: Context) {}
//   
//}
//
//
//
//#if DEBUG
//struct ARSceneView_Previews : PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//#endif
//
//
//
////struct ARView: View {
////    var body: some View {
////        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
////    }
////}
//
////struct ARView_Previews: PreviewProvider {
////    static var previews: some View {
////        ARView()
////    }
////}
