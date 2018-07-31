//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 28: Log a message

// Parameters: Accepts a path to a log file on disk as well as a new log message
// Function: Opens the log file (or creates it if it doesn't exist) and appends the new message to the log along with the current time and date

func challenge28(path: String, message: String) {
    
    var contents = (try? String(contentsOfFile: path)) ?? ""
    contents.append( "\(Date()) \(message)\n")
    
    do {
        try contents.write(toFile: path, atomically: true, encoding: .utf8)
    } catch let error {
        print("Failed to write contents to filepath with error: \(error.localizedDescription)")
    }
    
    
}



// Redoing Challenge 28: Log a message
// Accepts a path to a log file on disk as well as a new log message
// Opens the log file or creates it, then appends the new message to the log along with the current time and date

func logAMessage(logName: String, message: String) {
    var contents = (try? String(contentsOfFile: logName)) ?? "New message"
    contents.append("\n \(Date())")
    do {
        try contents.write(toFile: logName, atomically: true, encoding: .utf8)
    } catch let error {
        print("Failed to write to file", error.localizedDescription)
    }
}














































