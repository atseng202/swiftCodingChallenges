//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 35: Convert Images
// Tricky
// Parameters: Accepts a path to a directory
// Result: Converts to PNGs any JPEGs it finds in the directory, leavng the originals intact and if any JPEG can't be converted the function quietly continues

func challenge35ConvertJPEGS(in directory: String) {
    let fm = FileManager.default
    let directoryURL = URL(fileURLWithPath: directory)
    
    guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return }
    
    for file in files {
        if file.pathExtension == "jpg"  || file.pathExtension == "jpeg" {
            // convert file to PNG
            guard let image = UIImage(contentsOfFile: file.path), let png = UIImagePNGRepresentation(image) else { continue }
            
            let newFileName = file.deletingPathExtension().appendingPathExtension("png")
            _ = try? png.write(to: newFileName)
        }
    }
}



// MARK: - Redoing Challenge 35
// Accept path to directory then converts PNGs to JPEGs it finds in there

func convertImagesToJPEG(directoryName: String) {
    let fm = FileManager.default
    let dirUrl = URL(fileURLWithPath: directoryName)
    
    guard let urls = try? fm.contentsOfDirectory(at: dirUrl, includingPropertiesForKeys: nil) else { return }
    
    for url in urls {
        guard url.pathExtension == "jpeg" ||  url.pathExtension == "jpg", let image = UIImage(contentsOfFile: url.path) else { continue }
        guard let data = UIImageJPEGRepresentation(image, 0.8) else { continue }
        
        let newFilename = url.deletingPathExtension().appendingPathExtension("png")
        _ = try? data.write(to: newFilename)
    }
    
}














































