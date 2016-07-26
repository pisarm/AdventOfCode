//
//  Data+CryptoWrap.swift
//  CryptoWrap
//
//  Created by Flemming Pedersen on 25/07/16.
//  Copyright © 2016 pisarm.dk. All rights reserved.
//

import Foundation
import CommonCrypto

extension NSData {

    public var MD5: NSData {
        let hash = Digest.MD5(bytes: bytes, length: UInt32(length))
        return NSData(bytes: hash, length: hash.count)
//        return NSData(bytes: hash, length:  hash.count)
    }

}
