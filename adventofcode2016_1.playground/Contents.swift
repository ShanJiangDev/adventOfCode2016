//: Playground - noun: a place where people can play

import UIKit

enum Facing: Int{
    case north = 0
    case east = 1
    case south = 2
    case west = 3
}

var list = [""]
var cordination =  (0,0,Facing.north)
var visitedList = [(Int, Int)]()
var visitedTiwce = (0, 0, false)

if let path = Bundle.main.path(forResource: "File", ofType: "txt") {
    do {
        let data = try String(contentsOfFile: path, encoding: .utf8)
        list = data.components(separatedBy: ", ")
        if let trimmed = list.last?.replacingOccurrences(of: "\n", with: ""){
            list[list.count-1] = trimmed
        }
    } catch {
        print(error)
    }
}

func hasVisited(currentPosition:(Int, Int)){
    if(visitedTiwce.2 == false){
        for visitedPosition in visitedList {
            if(visitedPosition.0 == currentPosition.0 && visitedPosition.1 == currentPosition.1){
                visitedTiwce = (currentPosition.0, currentPosition.1, true)
                print("Passed by this location already: x: \(currentPosition.0), y: \(currentPosition.1)")
            }
        }
    }
   
}

func walk(length: Int, add: Bool, x: Bool) {
    var left = length
        print("Left: \(left)")
        let operation = (add, x)
        switch operation {
        case (true, true):
            while (left > 0){
                print("inside 1")
                print("walking: \(cordination)")
                cordination.0 += 1
                hasVisited(currentPosition: (cordination.0,cordination.1))
                visitedList += [(cordination.0, cordination.1)]
                left -= 1
            }
            
        case (true, false):
            while (left > 0){
                print("Inside 2")
                print("walking: \(cordination)")
                cordination.1 += 1
                hasVisited(currentPosition: (cordination.0,cordination.1))
                visitedList += [(cordination.0, cordination.1)]
                left -= 1
            }
           
        case (false, true):
            while (left > 0){
                print("Inside 3")
                print("walking: \(cordination)")
                cordination.0 -= 1
                hasVisited(currentPosition: (cordination.0,cordination.1))
                visitedList += [(cordination.0, cordination.1)]
                left -= 1
            }
            
        case (false, false):
            while (left > 0){
                print("Inside 4")
                print("walking: \(cordination)")
            	cordination.1 -= 1
                hasVisited(currentPosition: (cordination.0,cordination.1))
                visitedList += [(cordination.0, cordination.1)]
                left -= 1
            }
            
        }
    print("Error while moving")
   
}

for path in list {
    let head = String(path.characters.prefix(1))
    if let tail = Int(String(path.characters.dropFirst())){
        if(head == "R"){
            switch cordination.2{
            case Facing.north:
                walk(length: tail, add: true, x: true)
                cordination.2 = Facing.east
                print(cordination)
            case Facing.east:
                walk(length: tail, add: false, x: false)
                cordination.2 = Facing.south
                print(cordination)
            case Facing.south:
                walk(length: tail, add: false, x: true)
                cordination.2 = Facing.west
                print(cordination)
            case Facing.west:
                walk(length: tail, add: true, x: false)
                cordination.2 = Facing.north
                print(cordination)
            }
        }else{
                switch cordination.2{
                case Facing.north:
                    walk(length: tail, add: false, x: true)
                    cordination.2 = Facing.west
                    print(cordination)
                case Facing.west:
                    walk(length: tail, add: false, x: false)
                    cordination.2 = Facing.south
                    print(cordination)
                case Facing.south:
                    walk(length: tail, add: true, x: true)
                    cordination.2 = Facing.east
                    print(cordination)
                case Facing.east:
                    walk(length: tail, add: true, x: false)
                    cordination.2 = Facing.north
                    print(cordination)
            }
        }
    }
}



print("result: \(cordination)")
print("is there a position visited twice: \(visitedTiwce.2): Location x: \(visitedTiwce.0) y: \(visitedTiwce.1)")










