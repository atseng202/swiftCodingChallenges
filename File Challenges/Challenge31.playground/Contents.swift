//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 31: Copy Recursively
// Parameters: Accepts two paths, the first pointing to a directory to copy, the second being where the directory should be copied to
// Returns: True if the directory and all its contents were copied successfully; false if copy failed or the user specified something other than a directory

func challenge31(copyFrom: String, to: String) -> Bool {
    let directoryURL = URL(fileURLWithPath: copyFrom)
    let fm = FileManager.default
    
    guard let directoryData = try? Data(contentsOf: directoryURL) else { return false }
    
    guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return false }
    
    for file in files {
        guard let attributes = try? fm.attributesOfItem(atPath: file.path) else { return false }
        guard let _ = try? file.lastPathComponent.write(toFile: to, atomically: true, encoding: .utf8) else { return false }
    }
    return true
    
}

func challenge31WithHints(copy fromPath: String, toPath: String) -> Bool {
    let fm = FileManager.default
    var isDirectory: ObjCBool = false
    
    guard fm.fileExists(atPath: fromPath, isDirectory: &isDirectory) || isDirectory.boolValue == false else { return false }
    
    let sourceURL = URL(fileURLWithPath: fromPath)
    let destinationURL = URL(fileURLWithPath: toPath)
        do {
            try? fm.copyItem(at: sourceURL, to: destinationURL)
        } catch let error {
            print("Failed to copy item fromPath toPath")
            return false
        }
    

  
    return true
}




// MARK: - Challenge 31: Copy recursively
// Accepts two paths: first points to a directory to copy, second is the path where the first should be copied to
// Returns true if directory and all its contents were copied succesfully; false if failed or user specified something other than a directory

func copyDirectoryRecursively(fromPath: String, toPath: String) -> Bool {
    
    let fm = FileManager.default
    
    var isDirectory: ObjCBool = false
    
    if fm.fileExists(atPath: fromPath, isDirectory: &isDirectory) && isDirectory.boolValue == true {
        let copyURL = URL(fileURLWithPath: fromPath)
        let destinationURL = URL(fileURLWithPath: toPath)
        
        do {
            try fm.copyItem(at: copyURL, to: destinationURL)
        } catch {
            print("Copy failed: \(error.localizedDescription)")
            return false
        }

        
    } else {
        return false
    }
    
    return true
}
























































