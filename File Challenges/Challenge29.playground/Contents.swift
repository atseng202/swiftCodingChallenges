//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 29: Documents Directory
// Parameters: None
// Returns: The URL to the user's documents directory

func challenge29() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

// getDocsDirectoryURL
func getDocsDirectoryURL() -> URL {
    let fm = FileManager.default
    
    let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
    return urls[0]
}
















































