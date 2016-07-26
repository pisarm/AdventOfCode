//: Playground - noun: a place where people can play

import CryptoWrap

let secret = "yzbqklnj"
let prefix = "000000"

var count = -1
var digest: String!
repeat {
    count += 1
    digest = "\(secret)\(count)".MD5
} while !digest.hasPrefix(prefix)

print("Lowest number resulting in a digest with \(prefix) is \(count) (\(digest))")
