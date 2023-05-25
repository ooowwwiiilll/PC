//
//  KixApp.swift
//  Kix
//
//  Created by Obed Willhem on 18/05/23.
//

import SwiftUI

@main
struct KixApp: App {
//  @State var path: [Int] = []
  
  var body: some Scene {
    WindowGroup {
//      NavigationStack(path: $path) {
//        Intro(path: $path)
//      }
      Intro()
    }
  }
}
