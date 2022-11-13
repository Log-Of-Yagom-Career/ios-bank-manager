//  Bank.swift
//  BankManagerConsoleApp
//  Created by Baem & Bella on 2022/11/02.

import Foundation

struct Bank {
    private let manager = BankManager()
    private var lineOfCustomer = LinkedList<Customer>()
    
    private func receiveUserInput() -> String {
        guard let userInput = readLine() else {
            return receiveUserInput()
        }
        return userInput
    }
    
    mutating func openBank() -> [CustomerLabel] {
        let totalCustomer = 10
        
        listUpCustomer(totalCustomer)
        return manager.startTask(lineOfCustomer)
//        manager.endTask()
    }
    
    mutating private func listUpCustomer(_ customerCount: Int) {
        for customerIndex in 1...customerCount {
            lineOfCustomer.enqueue(value: Customer(waitingNumber: customerIndex, purposeOfService: randomTask()))
        }
    }
    
    private func randomTask() -> Task {
        Int.random(in: 1...2) == 1 ? .deposit : .loan
    }
}
