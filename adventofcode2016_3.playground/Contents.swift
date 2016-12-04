//: Playground - noun: a place where people can play

import UIKit

var list = [""]
var lists:[[Int]] = []
var verticalLists:[[Int]] = []

func read(){
    if let path = Bundle.main.path(forResource: "file", ofType: "txt") {
        do {
            let data = try String(contentsOfFile: path, encoding: .utf8)
            list = data.components(separatedBy: "\n")
            list.remove(at: (list.count - 1))

            for set in list{
                let trangle = matches(for: "[0-9]+", in:set)
                lists += [trangle.map{ Int($0)!}]
                print("set: \(set)")
            }
        } catch {
            print(error)
        }
    }
}

func readVertically(){
    if let path = Bundle.main.path(forResource: "file", ofType: "txt") {
        do {
            let data = try String(contentsOfFile: path, encoding: .utf8)
            list = data.components(separatedBy: "\n")
            list.remove(at: (list.count - 1))
            
            for set in list{
                let trangle = matches(for: "[0-9]+", in:set)
                lists += [trangle.map{ Int($0)!}]
            }
        } catch {
            print(error)
        }
    }
    
    var count = 0
    var runningTime = 0
    
    
    while(runningTime < lists.count/3){

        var threelists = lists[runningTime*3] + lists[runningTime*3+1] + lists[runningTime*3+2]
        
        if(count % 9 == 0){
             verticalLists += [[],[],[]]
        }
        for number in threelists{
            
            if(count % 3 == 0){
                verticalLists[0+runningTime*3] += [number]
                count += 1
            }else if(count % 3 == 1){
                verticalLists[1+runningTime*3] += [number]
                count += 1
            }else if(count % 3 == 2){
                verticalLists[2+runningTime*3] += [number]
                count += 1
            }
        }
        runningTime += 1
    }
    print(verticalLists)
}

func matches(for regex: String, in text: String) -> [String] {
    do {
        let regex = try NSRegularExpression(pattern: regex)
        let nsString = text as NSString
        let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
        return results.map { nsString.substring(with: $0.range)}
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}

func calaulate(){
    readVertically()
    var count = 0
    var answer = 0
    // For first question
    //for star in lists{
    // For second question
    for star in verticalLists{
        var middleValue = getMiddleNumber(min: star.min()!, max: star.max()!, count: count)
        if(star.min()! + middleValue > star.max()!){
            //print("It is a true star")
            answer += 1
        }
        count += 1
    }
    print("There are \(answer) stars")

}

func getMiddleNumber(min: Int, max: Int, count: Int) -> Int{
    // For first Question
    //var temp = lists[count]
    // For second question
    var temp = verticalLists[count]
    let indexMax = temp.index(of: max)!
    temp.remove(at: indexMax)
    let indexMin = temp.index(of: min)!
    temp.remove(at: indexMin)
    return temp[0]
}


calaulate()





var play = [[1,2,3],[1]]
play[1]
play[1].append(2)
play[1]












