//
//  Digest.swift
//  CryptoWrap
//
//  Created by Flemming Pedersen on 25/07/16.
//  Copyright © 2016 pisarm.dk. All rights reserved.
//

import CommonCrypto
import Foundation

public struct Digest {
    public static func MD5(bytes: UnsafePointer<Void>, length: UInt32) -> [UInt8] {
        var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(bytes, length, &hash)
        return hash
    }
}
