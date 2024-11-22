//
//  ContentView.swift
//  CameraPlayground
//
//  Created by Peter Molnar on 22/11/2024.
//

import SwiftUI

struct ContentView: View {
    private let deviceText: String
    private let cameras: [CameraInfo]
    private let pixelFormats: [String]
    private let pixelFormatTitle = "Available Pixel formats:"

    init(deviceName: String, cameras: [CameraInfo], pixelFormats: [String]) {
        self.deviceText = deviceName
        self.cameras = cameras
        self.pixelFormats = pixelFormats
    }
    
    var body: some View {
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
                makeConsoleReport()
            }
        }
        .padding()
    }
    
    private func makeConsoleReport() {
        print("Report")
        divider()
        print(deviceText)
        cameras.forEach {
            divider()
            print($0.description)
        }
        divider()
        print(pixelFormatTitle)
        pixelFormats.forEach { format in
            print(format)
        }
        
        func divider() {
            print("-------------------------")
        }
    }
    
}

#Preview {
    ContentView(deviceName: "A Device", cameras: [], pixelFormats: [])
}
