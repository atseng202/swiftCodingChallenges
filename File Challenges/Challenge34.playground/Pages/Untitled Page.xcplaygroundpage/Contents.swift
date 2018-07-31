//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 34: Find executables
// Parameters: Accepts the name of a directory to scan
// Returns: an array containing the name of any executable files in there

func challenge34(directoryName: String) -> [String] {
    let fm = FileManager.default
    let directoryUrl = URL(fileURLWithPath: directoryName)
    guard let files = (try? fm.contentsOfDirectory(at: directoryUrl, includingPropertiesForKeys: nil)) else { return [] }
    
    var isDirectory: ObjCBool = false
    var namesArray = [String]()
    
    for file in files {
        if fm.fileExists(atPath: file.path, isDirectory: &isDirectory) && isDirectory.boolValue == false {
            // file exists, it is not a directory
            if fm.isExecutableFile(atPath: file.path) {
                namesArray.append(file.lastPathComponent)
            }
        }
    }
    return namesArray
}

print(challenge34(directoryName: "testing123"))

func challenge34aUpdated(directoryName: String) -> [String] {
    let fm = FileManager.default
    let directoryURL = URL(fileURLWithPath: directoryName)
    
    guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else {
        print("Could not get files")
        return [] }
    
    var names = [String]()
    
    for file in files {
        guard file.hasDirectoryPath == false else { continue }
        // filtered out all files that were not directories, now check if executable
        if fm.isExecutableFile(atPath: file.path) {
            names.append(file.lastPathComponent)
        }
    }
    return names
}

//print(challenge34aUpdated(directoryName: "/Users/atseng202/Desktop/"))
let a = challenge34aUpdated(directoryName: "/Users/atseng202/Desktop/testing123")

// MARK: - Redoing Challenge 34
// Accept name of directory, returning array containing the name of any executable files in there

func executableFiles(directoryName: String) -> [String] {
    
    let fm = FileManager.default
    let directoryURL = URL(fileURLWithPath: directoryName)
    
    guard let contentsOfDirectory = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
    
    var executableFiles = [String]()
    
    for url in contentsOfDirectory {
        if url.hasDirectoryPath == false && fm.isExecutableFile(atPath: url.path) {
            executableFiles.append(url.lastPathComponent)
        }
    }
    
    return executableFiles
}












































