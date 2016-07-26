//
//  String+CryptoWrap.swift
//  CryptoWrap
//
//  Created by Flemming Pedersen on 25/07/16.
//  Copyright © 2016 pisarm.dk. All rights reserved.
//

import CommonCrypto
import Foundation

extension String {

    public var MD5: String? {
        return String(digestData: hashData?.MD5, length: CC_MD5_DIGEST_LENGTH)
    }

    private var hashData: NSData? {
        return data(using: String.Encoding.utf8)
    }

    private init?(digestData: NSData?, length: Int32) {
        guard let digestData = digestData else {
            return nil
        }

        var digest = [UInt8](repeating: 0, count: Int(length))
        digestData.getBytes(&digest, length: Int(length) * sizeof(UInt8.self))

        var string = ""
        for i in 0..<length {
            string += String(format: "%02x", digest[Int(i)])
        }
        self.init(string)
    }
}
