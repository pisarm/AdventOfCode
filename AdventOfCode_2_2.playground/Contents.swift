//: Playground - noun: a place where people can play

import Foundation

struct Box {
    let l: Int
    let w: Int
    let h: Int

    var sides: [Int] {
        return [l, w, h]
    }

    var sideAreas: [Int] {
        return [
            (2 * self.l * self.w),
            (2 * self.w * self.h),
            (2 * self.h * self.l),
            ]
    }

    var wrapping: Int {
        return sideAreas.reduce(0, combine: +)
    }

    var slack: Int {
        return sideAreas.min()! / 2
    }

    var ribbon: Int {
        let smallestTwoSides = sides.reduce((Int.max, Int.max)) { $1 < $0.0 ? ($1, $0.0) : ($1 < $0.1 ? ($0.0, $1) : $0) }
        return (smallestTwoSides.0 * 2) + (smallestTwoSides.1 * 2)
    }

    var bow: Int {
        return sides.reduce(1, combine: *)
    }
}

extension Box {
    init?(from string: String){
        let stringComponents = string.components(separatedBy: "x")
        guard stringComponents.count == 3 else {
            return nil
        }

        let integerComponents = stringComponents.map { Int($0)! }

        self.l = integerComponents[0]
        self.w = integerComponents[1]
        self.h = integerComponents[2]
    }
}

let path = Bundle.main.pathForResource("Data", ofType: "txt")
let rawData = FileManager.default.contents(atPath: path!)
let stringData = String(data: rawData!, encoding: String.Encoding.utf8)!

let boxes = stringData
    .components(separatedBy: "\n")
    .map { Box(from: $0) }
    .flatMap { $0 }

let totalWrappingPaper = boxes.reduce(0, combine: { $0.0 + ($0.1.slack + $0.1.wrapping) })
print("Total paper: \(totalWrappingPaper) feet")

let totalRibbon = boxes.reduce(0, combine: { $0.0 + ($0.1.ribbon + $0.1.bow) })
print("Total ribbon: \(totalRibbon) feet")
