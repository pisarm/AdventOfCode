//: Playground - noun: a place where people can play

import Foundation

let path = Bundle.main.path(forResource: "Data", ofType: "txt")
let rawData = FileManager.default.contents(atPath: path!)
let stringData = String(data: rawData!, encoding: String.Encoding.utf8)!

let strings = stringData
    .components(separatedBy: "\n")
    .filter { !$0.contains("ab") && !$0.contains("cd") && !$0.contains("pq") && !$0.contains("xy") }
    .filter {
        var count = 0
        $0.characters.forEach { c in
            if "aeiou".contains("\(c)") {
                count += 1
            }
        }
        return count < 3 ? false : true
    }
    .filter { string in
        for character in string.characters {
            if string.contains("\(character)\(character)") {
                return true
            }
        }

        return false
    }

print("Number of nice strings: \(strings.count)")

//This is copied from 5.1, in preparation for solving 5.2