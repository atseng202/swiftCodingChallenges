//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// MARK: - Challenge 36: Print error lines
// Parameters: Accepts a path to a log file on disk
// Returns: the number of lines that start with "[ERROR]"
// Note: The log file can be very large or may not exist
// Taxing Difficulty

func challenge36(logFileName: String) -> Int {
    
    let fileUrl = URL(fileURLWithPath: logFileName)
    guard let contents = try? String(contentsOf: fileUrl) else { return 0 }
    
    var count = 0
    
    let arrayOfContents = contents.components(separatedBy: "\n")
    for line in arrayOfContents {
        let lineArray = line.components(separatedBy: " ")
        if !lineArray.isEmpty, lineArray[0] == "[ERROR]" {
            count += 1
        }
    }
    
    return count
}

func answerChallenge36(filename: String) -> Int {
    var totalErrors = 0
    let reader = ChunkedFileReader(path: filename)
    
    while let line = reader.readLine() {
        if line.hasPrefix("[ERROR]") {
            totalErrors += 1
        }
    }
    return totalErrors
}

class ChunkedFileReader {
    
    var fileHandle: FileHandle?
    
    var buffer: Data
    
    let chunkSize: Int = 4
    
    let delimitter = "\n".data(using: .utf8)!
    
    init(path: String) {
        fileHandle = FileHandle(forReadingAtPath: path)
        buffer = Data(capacity: chunkSize)
    }
    func readLine() -> String? {
        var rangeOfDelimiter = buffer.range(of: delimitter)
        
        while rangeOfDelimiter == nil {
            guard let chunk = fileHandle?.readData(ofLength: chunkSize) else { return nil }
            if chunk.count == 0 {
                if buffer.count > 0 {
                    defer { buffer.count == 0 }
                    return String(data: buffer, encoding: .utf8)
                }
                return nil
            } else {
                buffer.append(chunk)
                
                rangeOfDelimiter = buffer.range(of: delimitter)
            }
        }
        let rangeOfLine = Range(0 ..< rangeOfDelimiter!.upperBound)
        let line = String(data: buffer.subdata(in: rangeOfLine), encoding: .utf8)
        buffer.removeSubrange(rangeOfLine)
        line?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return line
        
    }
}
