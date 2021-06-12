//
//  ContentView.swift
//  BlockchainSimpleSwiftUI
//
//  Created by Jorge Giannotta on 12/06/21.
//

import SwiftUI

struct ContentView: View {
    
    let firstAccount = 1001
    let secondAccount = 2002
    let bitcoinChain = Blockchain()
    let reward = 100
    var accounts: [String: Int] = ["0000": 10000000]
    let invalidAlert = UIAlertController(title: "Invalid Transaction", message: "Please check the details of your transaction as we were unable to process this.", preferredStyle: .alert)
    
    @State var account01: String = ""
    @State var account02: String = ""
    @State var balance01: Int = 0
    @State var balance02: Int = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            HStack(alignment: .center, spacing: nil, content: {
                Text("Cardano Wallet")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
            })
            Group{
                VStack(alignment: .center, spacing: nil, content: {
                    HStack(alignment: .center, spacing: nil, content: {
                        Text("Wallet 1")
                            .font(.title)
                            .foregroundColor(.red)
                        Spacer()
                    })
                    HStack(alignment: .center, spacing: nil, content: {
                        Text("Account: 01")
                            .font(.title3)
                        Spacer()
                        Text("Balance: \(balance01) ADA")
                            .font(.title3)
                    }).padding(.vertical)
                    HStack(alignment: .center, spacing: nil, content: {
                        Spacer()
                        TextField("Coins send to", text: $account01)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Spacer()
                    })
                    .padding()
                    HStack(alignment: .center, spacing: nil, content: {
                        Button(action: {
                            //Action Mine
                            balance01 += 100
                        }, label: {
                            Circle()
                                .frame(width: 80, height: 80, alignment: .center)
                                .foregroundColor(.red)
                                .overlay(
                                    Text("Mine")
                                        .foregroundColor(.white)
                                )
                        })
                        Spacer()
                        Button(action: {
                            //Action Send
                            if balance01 >= Int(account01) ?? 0  {
                                balance01 -= Int(account01) ?? 0
                                balance02 += Int(account01) ?? 0
                            }
                            account01 = ""
                        }, label: {
                            Circle()
                                .frame(width: 80, height: 80, alignment: .center)
                                .foregroundColor(.red)
                                .overlay(
                                    Text("Send")
                                        .foregroundColor(.white)
                                )
                        })
                    })
                    .padding()
                    .padding(.horizontal,50)
                })
                .padding()
            }
            Spacer()
            Group{
                VStack(alignment: .center, spacing: nil, content: {
                    HStack(alignment: .center, spacing: nil, content: {
                        Text("Wallet 2")
                            .font(.title)
                            .foregroundColor(.blue)
                        Spacer()
                    })
                    HStack(alignment: .center, spacing: nil, content: {
                        Text("Account: 02")
                            .font(.title3)
                        Spacer()
                        Text("Balance: \(balance02) ADA")
                            .font(.title3)
                    }).padding(.vertical)
                    HStack(alignment: .center, spacing: nil, content: {
                        Spacer()
                        TextField("Coins send to", text: $account02)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Spacer()
                    })
                    .padding()
                    HStack(alignment: .center, spacing: nil, content: {
                        Button(action: {
                            //Action Mine
                            balance02 += 100
                        }, label: {
                            Circle()
                                .frame(width: 80, height: 80, alignment: .center)
                                .foregroundColor(.blue)
                                .overlay(
                                    Text("Mine")
                                        .foregroundColor(.white)
                                )
                        })
                        
                        Spacer()
                        Button(action: {
                            //Action Send
                            if balance02 >= Int(account02) ?? 0 {
                                balance02 -= Int(account02) ?? 0
                                balance01 += Int(account02) ?? 0
                            }
                            account02 = ""
                        }, label: {
                            Circle()
                                .frame(width: 80, height: 80, alignment: .center)
                                .foregroundColor(.blue)
                                .overlay(
                                    Text("Send")
                                        .foregroundColor(.white)
                                )
                        })
                    })
                    .padding()
                    .padding(.horizontal,50)
                })
                .padding()
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
