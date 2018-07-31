//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 62: Points to angles
// TRICKY
// Write a function that accepts an array of CGPoint pairs, and returns an array of the angles between each point pair. Return the angles in degrees, where 0 or 360 degress is straight up

func challenge62(points: [(first: CGPoint, second: CGPoint)]) -> [CGFloat] {
    var angles = [CGFloat]()
    for pair in points {
        let dy = pair.second.y - pair.first.y
        let dx = pair.second.x - pair.first.x
        let angle = atan2(dy, dx)
        print(angle)
        var angleInDegrees = ((angle / CGFloat.pi) * 180) + 90
        if angleInDegrees < 0 { angleInDegrees += 360 }
        angles.append(angleInDegrees)
    }
    
    return angles
}


var points = [(first: CGPoint, second: CGPoint)]()
points.append((first: CGPoint.zero, second: CGPoint(x: 0, y: -100)))
points.append((first: CGPoint.zero, second: CGPoint(x: 100, y: -100)))
points.append((first: CGPoint.zero, second: CGPoint(x: 100, y: 0)))
points.append((first: CGPoint.zero, second: CGPoint(x: 100, y: 100)))
points.append((first: CGPoint.zero, second: CGPoint(x: 0, y: 100)))
points.append((first: CGPoint.zero, second: CGPoint(x: -100, y: 100)))
points.append((first: CGPoint.zero, second: CGPoint(x: -100, y: 0)))
points.append((first: CGPoint.zero, second: CGPoint(x: -100, y: -100)))


print(challenge62(points: points))
