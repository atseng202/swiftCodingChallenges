//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 60: Tic-Tac-Toe winner
// Tricky
// Create a function that detects whether either player has won in a game of Tic-Tac-Toe.
// The board is 3 x 3 (containing single letters that are either X, O, or empty. A win is three Xs or Os in a straight line.

func challenge60(board: [[String]]) -> Bool {

    for i in 0 ..< board.count {
        // check for each row
        if board[i][0] != "" && board[i][0] == board[i][1] && board[i][0] == board[i][2] {
            return true
        }
        
        // check each column
        if board[0][i] != "" && board[0][i] == board[1][i] && board[0][i] == board[2][i] {
            return true
        }
    }
    if board[0][0] != "" && board[0][0] == board[1][1] && board[0][0] == board[2][2] {
        return true
    }
    
    if board[2][0] != "" && board[2][0] == board[1][1] && board[2][0] == board[0][2] {
        return true
    }
    return false
}

// Iterated/Improved Answer
func challenge60a(board: [[String]]) -> Bool {
    for i in 0 ..< 3 {
        if isWin(board[i][0], board[i][1], board[i][2]) {
            return true
        }
        
        if isWin(board[0][i], board[1][i], board[2][i]) {
            return true
        }
    }
    
    return isWin(board[0][0], board[1][1], board[2][2]) || isWin(board[2][0], board[1][1], board[0][2])
}

private func isWin(_ first: String, _ second: String, _ third: String) -> Bool {
    guard first != "" else { return false }
    return first == second && first == third
}


let array = [["X", "", "O"], ["","X", "O"], ["", "", "X"]]
print(challenge60(board: array))
print(challenge60a(board: array))
