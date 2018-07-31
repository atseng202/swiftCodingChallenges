//: Playground - noun: a place where people can play

import UIKit
import GameplayKit

var str = "Hello, playground"

// MARK: - Challenge 63: Flood fill
// TAXING

let random = GKMersenneTwisterRandomSource(seed: 1)
var grid = (1...10).map { _ in (1...10).map { _
    in Int(random.nextInt(upperBound: 2)) } }

print(grid)

func challenge63(grid: [[Int]], numberToPlace: Int, startPosition: (x: Int, y: Int)) -> [[Int]] {
    guard startPosition.x >= 0, startPosition.y >= 0, startPosition.x < grid[0].count, startPosition.y < grid.count else { return grid }
    
    var grid = grid
    grid[startPosition.y][startPosition.x] = numberToPlace
    
    
    return grid
}
