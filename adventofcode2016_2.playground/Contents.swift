//: Playground - noun: a place where people can play

import UIKit
var list = [""]
var answer:[Int] = []

if let path = Bundle.main.path(forResource: "file", ofType: "txt") {
    do {
        let data = try String(contentsOfFile: path, encoding: .utf8)
        list = data.components(separatedBy: "\n")
        list.remove(at: (list.count - 1))
    } catch {
        print(error)
    }
}


func mainOne(){
    var start = 5
    for item in list{
        var count = 0
        while count < item.characters.count{
            switch item[item.index(item.startIndex, offsetBy: count)]{
                case "L":
                    if(start % 3 != 1){
                        start -= 1
                    }
                case "R":
                    if(start % 3 != 0){
                        start += 1
                    }
                case "U":
                    if(start > 3){
                        start -= 3
                    }
                case "D":
                    if(start < 7){
                        start += 3
                    }
                default:
                    print("Error from input")
            }
            count += 1
            
        }
        print("Answer for each item: \(start)")
        answer += [start]
    }
}

var notLeft = [1,2,5,10,13]
var notRight = [1,4,9,12,13]
var notUp = [1,2,4,5,9]
var notDown = [5,9,10,12,13]

func mainTwo(){
    var start = 5
    for item in list{
        var count = 0
        while count < item.characters.count{
            switch item[item.index(item.startIndex, offsetBy: count)]{
            case "L":
                if(!notLeft.contains(start)){
                    start -= 1
                }
            case "R":
                if(!notRight.contains(start)){
                    start += 1
                }
            case "U":
                if(!notUp.contains(start)){
                    if(start == 13 || start == 3){
                        start -= 2
                    }else{
                        start -= 4
                    }
                }
            case "D":
                if(!notDown.contains(start)){
                    if(start == 11 || start == 1){
                        start += 2
                    }else{
                        start += 4
                    }
                }
            default:
                print("Error from input")
            }
            count += 1
        }
        print("Answer for each item: \(start)")
        answer += [start]
    }
}

mainTwo()
