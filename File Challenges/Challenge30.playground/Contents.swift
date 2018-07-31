//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 30: New JPEGs
//  Parameters: Accepts a path to a directory
// Returns: An array of all JPEGs that have been created in the last 48 hours

func challenge30(in directory: String) -> [String] {
    
    let directoryURL = URL(fileURLWithPath: directory)
    guard let files = try? FileManager.default.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
    
    var jpegs = [String]()
    
    for file in files {
        if file.pathExtension == "jpg" || file.pathExtension == "jpeg" {
            guard let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) else { continue }
            guard let creationDate = attributes[.creationDate] as? Date else { continue }
            
            if creationDate > Date(timeIntervalSinceNow: -60 * 60 * 48) {
                jpegs.append(file.lastPathComponent)
            }
        }
    }
    return jpegs
}

// MARK: - Redoing Challenge 30: NEW JPEGs
func lastCreatedJPEGsInTwoDays(directoryName: String) -> [String] {
    
    let directoryURL = URL(fileURLWithPath: directoryName)
    let fm = FileManager.default
    
    guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil, options: []) else { return [] }
    
    var arrayOfJPEGs: [String] = []
    
    for file in files {
        if file.pathExtension == "jpg" || file.pathExtension == "jpeg" {
            guard let attributes = try? fm.attributesOfItem(atPath: file.path) else { continue }
            guard let creationDate = attributes[.creationDate] as? Date else { continue }
            
            if creationDate > Date(timeIntervalSinceNow: -60 * 60 * 48) {
                arrayOfJPEGs.append(file.lastPathComponent)
            }
        }
    }
    return arrayOfJPEGs
}











