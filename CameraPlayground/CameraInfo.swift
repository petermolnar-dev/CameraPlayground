//
//  CameraInfo.swift
//  CameraPlayground
//
//  Created by Peter Molnar on 22/11/2024.
//

import AVFoundation
import UIKit

struct CameraInfo: Identifiable, CustomStringConvertible {
    
    let id: String
    let localisedName: String
    let mediaSubType: String?
    let dimensions: (width: Int, height: Int)?
    
    var description: String {
        var basicInfo = "\(localisedName)\n\(id)\n"
        if let mediaSubType {
            basicInfo += "\nActive Format Media Subtype: \(mediaSubType.description)"
        }
        if let dimensions {
            basicInfo += " dimensions: \(dimensions.width)x\(dimensions.height)"
        }
        return basicInfo
    }

}

struct CameraInfoProvider {
    func getDeviceName() -> String {
        return UIDevice().type.rawValue
    }
    func getCameraListing() -> [CameraInfo] {
        
        let videoDiscoverySession = AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera],
            mediaType: .video,
            position: .unspecified)
        
        let videoDevices = videoDiscoverySession.devices
        
        return videoDevices.map { device in
            CameraInfo(
                id: device.uniqueID,
                localisedName: device.localizedName,
                mediaSubType: device.activeFormat.formatDescription.mediaSubType.description,
                dimensions: (
                    width: Int(device.activeFormat.formatDescription.dimensions.width),
                    height: Int(device.activeFormat.formatDescription.dimensions.height)))
        
        }
    }
    
    func getavailablePixelFormats() -> [String] {
        let availablePixelFormats = AVCaptureVideoDataOutput().availableVideoPixelFormatTypes
        print("Available pixel format count: \(availablePixelFormats.count)")
        
        return availablePixelFormats.compactMap { $0.string }
    }
}

extension FourCharCode {
    public var string: String? {
        let cString: [CChar] = [
            CChar(self >> 24 & 0xFF),
            CChar(self >> 16 & 0xFF),
            CChar(self >> 8 & 0xFF),
            CChar(self & 0xFF),
            0
        ]
        return String(cString: cString)
    }
}


