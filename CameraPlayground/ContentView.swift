//
//  ContentView.swift
//  CameraPlayground
//
//  Created by Peter Molnar on 22/11/2024.
//

import SwiftUI

struct ContentView: View {
    let info = CameraInfoProvider()
    
    var body: some View {
        let deviceText = "Device: \(info.getDeviceName())"
        let cameras = info.getCameraListing()
        let pixelFormatTitle = "Available Pixel formats:"
        let pixelFormats = info.getavailablePixelFormats()
        VStack {
            Text(deviceText)
            Text("Detected cameras:")
            List(cameras) { camera in
                Text(camera.description)
            }
            Text(pixelFormatTitle)
            List(pixelFormats, id: \.self) { format in
                Text(format)
            }
            Button("Print report to console") {
                print("Report")
                print(deviceText)
                cameras.forEach {
                    print($0.description)
                }
                print(pixelFormatTitle)
                pixelFormats.forEach { format in
                    print(format)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
