//
//  TestModeApp.swift
//  TestMode
//
//  Created by 能登 要 on 2021/04/05.
//

import SwiftUI
import UIKit

// Debug.xcconfig
// OTHER_SWIFT_FLAGS = $(inherited) "-D" "DEBUG"

// DebugStage.xcconfig
// OTHER_SWIFT_FLAGS = $(inherited) "-D" "DEBUG" "-D" "STAGE"

// Release.xcconfig
// OTHER_SWIFT_FLAGS = $(inherited)

// ReleaseStage.xcconfig
// OTHER_SWIFT_FLAGS = $(inherited) "-D" "STAGE"

@main
struct TestModeApp: App {
    let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    var body: some Scene {
        WindowGroup {
            ContentView(version: version, build: build)
                .onAppear(perform: {
#if STAGE
                    let taregetIconName: String? = "stage"
#else
                    let taregetIconName: String? = nil
#endif
                    if UIApplication.shared.alternateIconName != taregetIconName {
                        UIApplication.shared.setAlternateIconName(taregetIconName) { error in
                            print("/!\\ setAlternateIconName error! \(String(describing: error))")
                        }
                    }
                })
        }
    }
}

struct ContentView: View {
    let version: String
    let build: String
    var body: some View {
        Text("version \(version)(\(build))")
            .padding()
    }
}
