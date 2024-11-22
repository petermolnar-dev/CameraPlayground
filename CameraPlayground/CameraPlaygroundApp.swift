//
//  CameraPlaygroundApp.swift
//  CameraPlayground
//
//  Created by Peter Molnar on 22/11/2024.
//

import SwiftUI

@main
struct CameraPlaygroundApp: App {
    let info = CameraInfoProvider()
    
    var body: some Scene {
        WindowGroup {
            ContentView(
                deviceName: "Device: \(info.getDeviceName())",
                cameras: info.getCameraListing(),
                pixelFormats: info.getavailablePixelFormats())
        }
    }
}
