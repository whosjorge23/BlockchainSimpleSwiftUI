//
//  Block.swift
//  BlockchainSimpleSwiftUI
//
//  Created by Jorge Giannotta on 12/06/21.
//

import UIKit

class Block {
    // Enter the logic for the Block here
    var hash: String!
    var data: String!
    var previousHash: String!
    var index: Int!
    
    func generateHash() -> String {
        return NSUUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
}
