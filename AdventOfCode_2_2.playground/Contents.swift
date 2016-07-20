//: Playground - noun: a place where people can play

import Foundation

struct Box {
    let l: Int
    let w: Int
    let h: Int

    var sides: [Int] {
        return [
            (2 * self.l * self.w),
            (2 * self.w * self.h),
            (2 * self.h * self.l),
            ]
    }

    var wrapping: Int {
        return sides.reduce(0, combine: +)
    }

    var slack: Int {
        return sides.min()! / 2
    }
}

let path = Bundle.main.pathForResource("Data", ofType: "txt")
let data = FileManager.default.contents(atPath: path!)
let csv = String(data: data!, encoding: String.Encoding.utf8)!

let total = csv
    .components(separatedBy: "\n")
    .filter { $0.characters.count > 0 }
    .map ({
        $0.components(separatedBy: "x").map({ Int($0)! })
    })
    .map({
        boxInts in return Box(l: boxInts[0], w: boxInts[1], h: boxInts[2])
    })
    .reduce(0, combine: { return $0.0 + ($0.1.slack + $0.1.wrapping) })

print("Total feet of paper required for wrapping: \(total)")
