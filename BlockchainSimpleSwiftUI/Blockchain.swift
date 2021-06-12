//
//  Blockchain.swift
//  BlockchainSimpleSwiftUI
//
//  Created by Jorge Giannotta on 12/06/21.
//

import UIKit

class Blockchain {
    // Enter the logic for the Blockchain here
    var chain = [Block]()
    
    func createGenesisBlock(data:String) {
        let genesisBlock = Block()
        genesisBlock.hash = genesisBlock.generateHash()
        genesisBlock.data = data
        genesisBlock.previousHash = "0000"
        genesisBlock.index = 0
        chain.append(genesisBlock)
    }
     
    func createBlock(data:String) {
        let newBlock = Block()
        newBlock.hash = newBlock.generateHash()
        newBlock.data = data
        newBlock.previousHash = chain[chain.count-1].hash
        newBlock.index = chain.count
        chain.append(newBlock)
    }
}
