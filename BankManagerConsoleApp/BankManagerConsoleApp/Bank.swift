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
        let totalCustomer = Int.random(in: 10...30)
        
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
        DispatchQueue.global().async { [self] in
            while lineOfLoanCustomer.isEmpty == false {
                guard let currentCustomer = lineOfLoanCustomer.dequeue() else {
                    print("111111")
                    break
                }
                loan1.task(customer: currentCustomer)
            }
        }
        while lineOfLoanCustomer.isEmpty == false {
            guard let currentCustomer = lineOfLoanCustomer.dequeue() else {
                print("111111")
                break
            }
            DispatchQueue.global().sync {
                loan1.task(customer: currentCustomer)
            }
        }
        while lineOfDepositCustomer.isEmpty == false {
            guard let currentCustomer = lineOfDepositCustomer.dequeue() else {
                print("222222")
                break
            }
            DispatchQueue.global().sync {
                depo1.task(customer: currentCustomer)
            }
        }
        while lineOfDepositCustomer.isEmpty == false {
            guard let currentCustomer = lineOfDepositCustomer.dequeue() else {
                print("3333333")
                break
            }
            DispatchQueue.global().sync {
                depo2.task(customer: currentCustomer)
            }
        }
        
//        while lineOfLoanCustomer.isEmpty == false {
//            guard let currentCustomer = lineOfLoanCustomer.dequeue() else {
//                print("2222222")
//                break
//            }
//            DispatchQueue.global().sync {
//                depo2.task(customer: currentCustomer)
//            }
//        }
        
//        while lineOfDepositCustomer.isEmpty == false {
//            guard let currentCustomer = lineOfDepositCustomer.dequeue() else {
//                break
//            }
//            depo1.task(customer: currentCustomer)
//        }
//
//        DispatchQueue.global().async {
//
//            while lineOfDepositCustomer.isEmpty == false {
//                guard let currentCustomer = lineOfDepositCustomer.dequeue() else {
//                    break
//                }
//                depo1.task(customer: currentCustomer)
//            }
//
//        }
//        DispatchQueue.global().async {
//
//            while lineOfDepositCustomer.isEmpty == false {
//                guard let currentCustomer = lineOfDepositCustomer.dequeue() else {
//                    break
//                }
//                depo2.task(customer: currentCustomer)
//            }
//
//        }
        
//
//        DispatchQueue.global().async {
//            <#code#>
//        }
    }
    
//    mutating private func startTask() {
//        taskTime = 0
//        processedCustomer = 0
//
//        while lineOfCustomer.isEmpty == false {
//            guard let currentCustomer = lineOfCustomer.dequeue() else {
//                break
//            }
//            print("\(currentCustomer.waitingNumber)번 고객 업무 시작")
//            taskTime += 0.7
//            usleep(70_000)
//            processedCustomer += 1
//            print("\(currentCustomer.waitingNumber)번 고객 업무 종료")
//        }
//
//        taskTime = round(taskTime * 100)/100
//        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(processedCustomer)명이며, 총 업무시간은 \(taskTime)초입니다.")
//    }
}
