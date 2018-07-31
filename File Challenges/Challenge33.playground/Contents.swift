//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - CHallenge 33: Find duplicate filenames
// Tricky
// Parameters: Accepts the name of a directory to scan
// Returns: An array of filenames that appear more than once in that directory or any of its sub-directories (Should can ALL subdirectories, including subdirectories of subdirectories)


// Recursive Method
func challenge33(directoryName: String, seenFile: Set<String> = Set<String>(), duplicateFile: Set<String> = Set<String>()) -> [String] {
    let fm = FileManager.default
    let directoryURL = URL(fileURLWithPath: directoryName)
    
    var isDirectory: ObjCBool = false
    
    guard let directorySubfiles = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else {
        print("Failed!")
        return [] }
    
    // TODO: - Check if it is a file. If it is check if duplicate and keep track of seen elements
    //         Otherwise, it is a directory and add the current duplicates to the result of calling the function on the subdirectory
    
    var seen: Set<String> = seenFile
    var duplicates: Set<String> = duplicateFile
    
    for file in directorySubfiles {
        if fm.fileExists(atPath: file.path, isDirectory: &isDirectory) && isDirectory.boolValue == false {
            // Not a directory therefore it is a file
            if seen.contains(file.lastPathComponent) {
                duplicates.insert(file.lastPathComponent)
            }
            seen.insert(file.lastPathComponent)
        } else if fm.fileExists(atPath: file.path, isDirectory: &isDirectory) && isDirectory.boolValue == true {
            // Is a directory
            var arrayOfDuplicates = Array(duplicates)
            arrayOfDuplicates = challenge33(directoryName: file.path, seenFile: seen, duplicateFile: duplicates)
        }
    }
    
    return Array(duplicates)
}

// MARK: - Retrying the handler method where iOS does subdirectory recursion for us
func challenge33Again(directoryName: String) -> [String] {
    
    let fm = FileManager.default
    let dirURL = URL(fileURLWithPath: directoryName)
    
    guard let files = fm.enumerator(at: dirURL, includingPropertiesForKeys: nil) else { return [] }
    
    var seen: Set<String> = Set<String>()
    var dups: Set<String> = Set<String>()
    
    for case let url as URL in files {
        guard url.hasDirectoryPath == false else { continue }
        // Checked that the url path is not a directory and therefore a file
        if seen.contains(url.lastPathComponent) {
            dups.insert(url.lastPathComponent)
        }
        seen.insert(url.lastPathComponent)
    }
    
    
    return Array(dups)
}

// Semi-failed, use FileManagers deep search methods for directories
func challenge33a(directoryName: String) -> [String] {
    let fm = FileManager.default
    let url = URL(fileURLWithPath: directoryName)
    guard let files = fm.enumerator(at: url, includingPropertiesForKeys: nil) else { return [] }
    var duplicates = Set<String>()
    var seen = Set<String>()
    
    for file in files {
        if let url = file as? URL {
            guard url.hasDirectoryPath == false else { continue }
            let filename = url.lastPathComponent
            if seen.contains(filename) {
                duplicates.insert(filename)
            }
            seen.insert(filename)
        }
    }
    return Array(duplicates)
}


// MARK: - Redoing Challenge 33

// Accepts name of directory to scan and returns array of filenames that appear more than once in that directory or any of its subdirectories

func duplicateFilenames(directoryName: String) -> [String] {
    
    let fm = FileManager.default
    let directoryURL = URL(fileURLWithPath: directoryName)
    guard let files = fm.enumerator(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
    
    var seen = Set<String>()
    var duplicate = Set<String>()
    
    for case let file as URL in files {
        guard file.hasDirectoryPath == false else { continue }
        if seen.contains(file.lastPathComponent) {
            duplicate.insert(file.lastPathComponent)
        }
        seen.insert(file.lastPathComponent)
    }
    
    
    return Array(duplicate)
}










































