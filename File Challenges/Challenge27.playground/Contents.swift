//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 27: Print last lines
// Parameters: Accepts a filename on disk
// Prints its last N lines in reverse order, all separated on a single line separated by commas

func challenge27(inputName: String, numberOfLines: Int) {
    guard let text = try? String(contentsOfFile: inputName) else { return }
    
    var array = text.components(separatedBy: "\n")
    array.reverse()
    
    let maxNumber = min(numberOfLines, array.count)
    for count in 0..<maxNumber {
        if count < maxNumber - 1 {
            print(array[count] + ", ")
        } else {
            print(array[count])
        }
    }
    
}


// More Optimal solution

func challenge27a(input: String, lineCount: Int) {
    guard let input = try? String(contentsOfFile: input) else { return }
    
    var array = input.components(separatedBy: "/n")
    guard array.count > 0 else { return }
    array.reverse()
    
    var answerArray = [String]()
    for i in 0..<min(array.count, lineCount) {
        answerArray.append(array[i])
    }
    print(answerArray.joined(separator: ", "))
}

// Retrying challenge27 for review
// Accepts filename on disk, printing last N lines in reverse order all on a single line separated by commas


func printLastLines(filename: String, numberOfLines: Int) {
    guard let string = try? String(contentsOfFile: filename) else { return }
    var arrayOfWords = string.components(separatedBy: "\n")
    arrayOfWords.reverse()
    
    var wordsToPrint = [String]()
    let count = min(arrayOfWords.count, numberOfLines)
    for i in 0..<count {
        wordsToPrint[i] = arrayOfWords[i]
    }
    print(wordsToPrint.joined(separator: ","))
}






























































