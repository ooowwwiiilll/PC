//
//  ContentView.swift
//  Kix
//
//  Created by Obed Willhem on 18/05/23.
//

import SwiftUI
import SceneKit
import AVKit
import AudioToolbox

struct ContentView: View {
  
  @State private var info = false
  
  @State var scene : SCNScene? = .init(named: "POND22.scn")
  @State var logoColor : Color = .white
  @State var laceColor : Color = .white
  @State var bodyColor : Color = .white
  @State var solColor : Color = .white
  @State var pinColor : Color = .white
  @State var branchColor : Color = .white
  @State var groundColor : Color = .white
  @State var rocksColor : Color = .white
  @State var waterColor : Color = .white
  @State var plantsColor : Color = .white
  @State var lilliesColor : Color = .white
  
  @State private var fade2 = false
  @State private var hstack1Opacity: Double = 1
  @State private var hstack2Opacity: Double = 0
  @State var hstack3Opacity: Double = 1
  @State var pickerOpacity: Double = 0
  
  
  
  
  
  class SoundManager {
    static let instance = SoundManager()
    var player : AVAudioPlayer?
    enum SoundOption: String {
      case lowfii
      case bop1
    }
    
    func playSound(sound: SoundOption) {
      guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
      do {
        player = try AVAudioPlayer(contentsOf: url)
        player?.numberOfLoops = -1
        player?.play()
      }
      catch _ {
        print("error sfx")
      }
    }
  }
  
  var body: some View {
    
    NavigationStack {
      ZStack {
        
        Color.black.opacity(0.3)
          .edgesIgnoringSafeArea(.all)
        Color.white.opacity(0.2)
          .edgesIgnoringSafeArea(.all)
        
        VStack (spacing: 12) {
          
          // scene
          ZStack (alignment: .bottom) {
            SceneKitView(scene: $scene)
              .frame(height: UIScreen.main.bounds.height / 2)
              .cornerRadius(8)
          }
          
          ZStack (alignment: .top) {
            
            if info {
              
              VStack {
                
                // coloring
                ScrollView {
                  VStack (spacing: 6) {
                    
                    ColorPicker(selection: $bodyColor){
                      Text("SH0E B0DY")
                        .fontDesign(.monospaced).kerning(-0.5).foregroundColor(.black)
                    }
                    .padding(.horizontal, 16).padding(.vertical, 8).background(Color.white).cornerRadius(8)
                    .onChange(of: bodyColor) { newValue in
                      self.change(asset: "Body",col: bodyColor)
                      self.change(asset: "Body1",col: bodyColor)
                      self.change(asset: "Body2",col: bodyColor)
                      self.change(asset: "Body3",col: bodyColor)
                      self.change(asset: "Tounge",col: bodyColor)
                      self.change(asset: "Panel",col: bodyColor)
                      self.change(asset: "Panel1",col: bodyColor)
                      self.change(asset: "Panel2",col: bodyColor)
                      self.change(asset: "Lace",col: bodyColor)
                      self.change(asset: "Lace1",col: bodyColor)
                      self.change(asset: "Lace2",col: bodyColor)
                      self.change(asset: "Lace3",col: bodyColor)
                      self.change(asset: "Lace4",col: bodyColor)
                    }
                    
                    ColorPicker(selection: $solColor){
                      Text("SH0E S0LE")
                        .fontDesign(.monospaced).kerning(-0.5).foregroundColor(.black)
                    }
                    .padding(.horizontal, 16).padding(.vertical, 8).background(Color.white).cornerRadius(8)
                    .onChange(of: solColor) { newValue in
                      self.change(asset: "Sole",col: solColor)
                      self.change(asset: "Sole1",col: solColor)
                      self.change(asset: "Sole2",col: solColor)
                      self.change(asset: "Sole3",col: solColor)
                      self.change(asset: "SoleLogo",col: solColor)
                    }
                    
                    ColorPicker(selection: $logoColor){
                      Text("SH0E L0G0")
                        .fontDesign(.monospaced).kerning(-0.5).foregroundColor(.black)
                    }
                    .padding(.horizontal, 16).padding(.vertical, 8).background(Color.white).cornerRadius(8)
                    .onChange(of: logoColor) { newValue in
                      self.change(asset: "Swoosh",col: logoColor)
                      self.change(asset: "HeelLogo",col: logoColor)
                      self.change(asset: "Pin",col: logoColor)
                      
                    }
                    
                    ColorPicker(selection: $groundColor){
                      Text("GR0UND")
                        .fontDesign(.monospaced).kerning(-0.5).foregroundColor(.black)
                    }
                    .padding(.horizontal, 16).padding(.vertical, 8).background(Color.white).cornerRadius(8)
                    .onChange(of: groundColor) { newValue in
                      self.change(asset: "ground",col: groundColor)
                    }
                    
                    ColorPicker(selection: $rocksColor){
                      Text("R0CKS")
                        .fontDesign(.monospaced).kerning(-0.5).foregroundColor(.black)
                    }
                    .padding(.horizontal, 16).padding(.vertical, 8).background(Color.white).cornerRadius(8)
                    .onChange(of: rocksColor) { newValue in
                      self.change(asset: "rocks",col: rocksColor)
                    }
                    
                    ColorPicker(selection: $waterColor){
                      Text("WATER")
                        .fontDesign(.monospaced).kerning(-0.5).foregroundColor(.black)
                    }
                    .padding(.horizontal, 16).padding(.vertical, 8).background(Color.white).cornerRadius(8)
                    .onChange(of: waterColor) { newValue in
                      self.change(asset: "water",col: waterColor)
                    }
                    
                    ColorPicker(selection: $plantsColor){
                      Text("PLANTS")
                        .fontDesign(.monospaced).kerning(-0.5).foregroundColor(.black)
                    }
                    .padding(.horizontal, 16).padding(.vertical, 8).background(Color.white).cornerRadius(8)
                    .onChange(of: plantsColor) { newValue in
                      self.change(asset: "plants",col: plantsColor)
                    }
                    
                    ColorPicker(selection: $lilliesColor){
                      Text("LILLIES")
                        .fontDesign(.monospaced).kerning(-0.5).foregroundColor(.black)
                    }
                    .padding(.horizontal, 16).padding(.vertical, 8).background(Color.white).cornerRadius(8)
                    .onChange(of: lilliesColor) { newValue in
                      self.change(asset: "lillies",col: lilliesColor)
                    }
                    
                  }
                }
                
                // next button
                NavigationLink {
                  FullScreen(scene: $scene)
                }
//                Button {
//                  // Create a new USDZ file.
//                  let usdzFile = URL(fileURLWithPath: NSTemporaryDirectory() + "/my-usdz-file.usdz")
//
//                  // Export the SCN file to the USDZ file.
//                  do {
//                    try SCNScene(named: "POND22.scn", inDirectory: "../Objects").write(to: usdzFile)
//                  } catch {
//                      print(error)
//                  }
//                }
                label: {
                  ZStack {
                    Rectangle()
                      .fill(Color.black.opacity(0.7))
                      .frame(width: .infinity, height: 48).cornerRadius(8)
                    HStack {
                      Text("FINISH C0L0RING").foregroundColor(.white)
                      Image(systemName: "chevron.right.circle.fill")
                        .foregroundColor(.red)
                    }
                    .fontDesign(.monospaced).kerning(-0.5)
                  }
                }
              }.opacity(pickerOpacity)
              
              // story
              ZStack (alignment: .top) {
                Rectangle()
                  .fill(.black.opacity(0.7))
                  .frame(width: .infinity, height: UIScreen.main.bounds.height / 14)
                  .cornerRadius(8)
                
                HStack {
                  Text("L00K AT THAT CHERRY BL0SSOM TREE.\nISN'T IT PRETTY?")
                    .multilineTextAlignment(.leading)
                    .fontDesign(.monospaced).kerning(-0.5).font(.system(size: 12)).foregroundColor(.white)
                  Spacer()
                  Button(action: {
                    AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {   }

//                    SoundManager.instance.playSound(sound: .bop1)
                    withAnimation(.easeInOut(duration: 0.5)) {
                      hstack1Opacity = 0
                      hstack2Opacity = 1
                    }
                  }) {
                    Image(systemName: "chevron.right.circle.fill")
                      .fontDesign(.monospaced).kerning(-0.5).font(.system(size: 26)).foregroundColor(.red)
                  }
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .opacity(hstack1Opacity)
                
                HStack {
                  Text("BUT IT LOOKS SO LONELY...\nLET'S COLOR THE OTHER OBJECTS!")
                    .multilineTextAlignment(.leading)
                    .fontDesign(.monospaced).kerning(-0.5).font(.system(size: 12)).foregroundColor(.white)
                  Spacer()
                  Button(action: {
                    AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {   }
//                    SoundManager.instance.playSound(sound: .bop1)
                    withAnimation(.easeInOut(duration: 0.5)) {
                      hstack3Opacity = 0
                      pickerOpacity = 1
                    }
                  }) {
                    Image(systemName: "chevron.right.circle.fill")
                      .fontDesign(.monospaced).kerning(-0.5).font(.system(size: 26)).foregroundColor(.red)
                  }
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .opacity(hstack2Opacity)
                
              }.opacity(hstack3Opacity)
            }
          }
        }.padding(24)
      }
      .navigationBarBackButtonHidden()
      .navigationTitle("")
      .onAppear {
        SoundManager.instance.playSound(sound: .lowfii)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
          withAnimation(.easeIn(duration: 1.4)) {
            info = true
          }
        }
      }
    }
    
  }
  
  func change(asset:String,col:Color){
    scene?.rootNode.childNode(withName: asset, recursively: true)?.geometry?.firstMaterial?.diffuse.contents = col.cgColor
  }
  
}






struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

public extension UIImage {
  convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
    let rect = CGRect(origin: .zero, size: size)
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
    color.setFill()
    UIRectFill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    guard let cgImage = image?.cgImage else { return nil }
    self.init(cgImage: cgImage)
  }
}
