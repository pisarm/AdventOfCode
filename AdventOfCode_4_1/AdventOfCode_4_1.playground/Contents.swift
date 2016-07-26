//: Playground - noun: a place where people can play

//Please make sure that you open the CryptoWrap workspace, and build the CryptoWrap module before running the playground

import CryptoWrap

let secret = "yzbqklnj"
let prefix = "00000"

var count = -1
var digest: String!
repeat {
    count += 1
    digest = "\(secret)\(count)".MD5
} while !digest.hasPrefix(prefix)

print("Lowest number resulting in a digest with \(prefix) is \(count) (\(digest))")
