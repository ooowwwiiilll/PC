//
//  FullScreen.swift
//  Kix
//
//  Created by Obed Willhem on 25/05/23.
//

import SwiftUI
import ARKit

struct FullScreen: View {
  
  @Binding var scene : SCNScene?
  
  
  var body: some View {
    NavigationStack {
      ZStack (alignment: .top) {
        SceneKitView2(scene: $scene)
          .edgesIgnoringSafeArea(.all)
        
        VStack (spacing: 8) {
          
          ZStack (alignment: .top) {
            Rectangle()
              .fill(.black.opacity(0.5))
              .frame(width: .infinity, height: UIScreen.main.bounds.height / 16)
              .cornerRadius(8)
            Text("AMAZING! THE SCENE IS COMPLETE.\nNOW SIT BACK, ENJOY THIS MOMENT.")
              .multilineTextAlignment(.center)
              .fontDesign(.monospaced).kerning(-0.5).font(.system(size: 12)).foregroundColor(.white)
              .padding(.vertical, 12)
              .padding(.horizontal, 16)
          }
          
//          ZStack (alignment: .top) {
//            Rectangle()
//              .fill(.black.opacity(0.5))
//              .frame(width: .infinity, height: UIScreen.main.bounds.height / 30)
//              .cornerRadius(8)
//            Text("TAP THE SCENE TO MAKE IT ALIVE. DRAG THE SCENE TO LOOK AROUND.")
//              .multilineTextAlignment(.center)
//              .fontDesign(.monospaced).kerning(-0.5).font(.system(size: 8)).foregroundColor(.white)
//              .padding(.vertical, 6)
//              .padding(.horizontal, 8)
//          }
          
          Text("TAP THE SCENE TO MAKE IT ALIVE. DRAG THE SCENE TO LOOK AROUND.")
            .multilineTextAlignment(.center)
            .fontDesign(.monospaced).kerning(-0.5).font(.system(size: 8)).foregroundColor(.black)
            .padding(.vertical, 6)
            .padding(.horizontal, 8)
          
        }
        .offset(y: 12)
        .padding(24)
        
      }
      .navigationBarBackButtonHidden()
    }
  }
}

//struct FullScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        FullScreen()
//    }
//}
