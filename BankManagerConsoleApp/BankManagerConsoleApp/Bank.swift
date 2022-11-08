//  Bank.swift
//  BankManagerConsoleApp
//  Created by Baem & Bella on 2022/11/02.

import Foundation

struct Bank {
    private let manager = [BankManager]()
    private var lineOfDepositCustomer = LinkedList<Customer>()
    private var lineOfLoanCustomer = LinkedList<Customer>()
    private var processedCustomer: Int = 0
    private var taskTime: Double = 0
    
    mutating func selectMenu() {
        print(" 1 : 은행개점\n 2 : 종료\n입력 :", terminator: " ")
        switch receiveUserInput() {
        case "1":
            openBank()
        case "2":
            return
        default:
            print("잘못된 입력값입니다. 다시 입력해주세요.")
            selectMenu()
        }
    }
    
    private func receiveUserInput() -> String {
        guard let userInput = readLine() else {
            return receiveUserInput()
        }
        return userInput
    }
    
    mutating private func openBank() {
        let totalCustomer = 10//Int.random(in: 10...30)
        
        listUpCustomer(totalCustomer)
        startTask()
        selectMenu()
    }
    
    mutating private func listUpCustomer(_ customerCount: Int) {
        for customerIndex in 1...customerCount {
            switch randomTask() {
            case .deposit:
                lineOfDepositCustomer.enqueue(value: Customer(waitingNumber: customerIndex, purposeOfServie: .deposit))
            case .loan:
                lineOfLoanCustomer.enqueue(value: Customer(waitingNumber: customerIndex, purposeOfServie: .loan))
            }
        }
    }
    
    func randomTask() -> Task {
        Int.random(in: 1...2) == 1 ? .deposit : .loan
    }
    
    mutating private func startTask() {
        let depo1 = BankManager(nickName: "예금이1", task: .deposit)
        let depo2 = BankManager(nickName: "예금이2", task: .deposit)
        let loan1 = BankManager(nickName: "대출이1", task: .loan)
        
        let loanSemaphore = DispatchSemaphore(value: 1)
        let depoSemaphpre = DispatchSemaphore(value: 2)
        
        while lineOfLoanCustomer.isEmpty == false {
            guard let currentCustomer = lineOfLoanCustomer.dequeue() else {
                print("111111")
                break
            }
            
            DispatchQueue.global().async {
                loanSemaphore.wait()
                loan1.task(customer: currentCustomer)
                loanSemaphore.signal()
            }
        }
        
        while lineOfDepositCustomer.isEmpty == false {
            guard let currentCustomer = lineOfDepositCustomer.dequeue() else {
                print("2222222")
                break
            }
            
            DispatchQueue.global().async {
                depoSemaphpre.wait()
                depo1.task(customer: currentCustomer)
                depoSemaphpre.signal()
            }
            print("예금 1")
        }
        
        while lineOfDepositCustomer.isEmpty == false {
            guard let currentCustomer = lineOfDepositCustomer.dequeue() else {
                print("3333333")
                break
            }
            
            DispatchQueue.global().async {
                depoSemaphpre.wait()
                depo2.task(customer: currentCustomer)
                depoSemaphpre.signal()
            }
            print("예금 2")
        }
    }
    
//        taskTime = round(taskTime * 100)/100
//        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(processedCustomer)명이며, 총 업무시간은 \(taskTime)초입니다.")
}
