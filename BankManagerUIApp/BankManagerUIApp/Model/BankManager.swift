//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    private let taskingGroup = DispatchGroup()
    private let loanFront = Task.loan.front
    private let depositFront = Task.deposit.front
    private var depositTimer: TimeInterval = 0
    private var loanTimer: TimeInterval = 0
    private var processedCustomer: Int = 0
    
    func startTask(_ customerList: LinkedList<Customer>) -> [CustomerLabel] {
        let loanSemaphore = DispatchSemaphore(value: loanFront)
        let depoSemaphore = DispatchSemaphore(value: depositFront)
        var lineOfCustomer = customerList
        var returnCustomerLabels = [CustomerLabel]()
        
        while lineOfCustomer.isEmpty == false {
            guard let currentCustomer = lineOfCustomer.dequeue() else { break }
            let settingCustomerUILabel = CustomerLabel()
            
            switch currentCustomer.purposeOfService {
            case .deposit:
                dispatchTask(of: currentCustomer, using: depoSemaphore)
                settingCustomerUILabel.text = "예금 - \(currentCustomer.waitingNumber)"
            case .loan:
                dispatchTask(of: currentCustomer, using: loanSemaphore)
                settingCustomerUILabel.text = "대출 - \(currentCustomer.waitingNumber)"
            }
            returnCustomerLabels.append(settingCustomerUILabel)
        }
        taskingGroup.wait()
        
        return returnCustomerLabels
    }
    
    private func dispatchTask(of currentCustomer: Customer, using semaphore: DispatchSemaphore) {
        DispatchQueue.global().async(group: taskingGroup) {
            semaphore.wait()
            self.task(customer: currentCustomer)
            switch currentCustomer.purposeOfService {
            case .deposit:
                self.addDepositTime()
            case .loan:
                self.addLoanTime()
            }
            semaphore.signal()
            self.addCustomer()
        }
    }
    
    private func task(customer: Customer) {
        print("\(customer.waitingNumber)번 고객 \(customer.purposeOfService.rawValue)업무 시작")
        
        switch customer.purposeOfService {
        case .deposit:
            usleep(700)
//            usleep(700_000)
        case .loan:
//            usleep(1_100_000)
            usleep(700)
        }
        print("\(customer.waitingNumber)번 고객 \(customer.purposeOfService.rawValue)업무 종료")
    }
    
    func endTask() {
        var taskTime = depositTimer > loanTimer ? depositTimer : loanTimer
        taskTime = Double(round(taskTime * 100) / 100)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(processedCustomer)명이며, 총 업무시간은 \(taskTime)초입니다.")
        managerClear()
    }
    
    private func addDepositTime () {
        depositTimer += 0.7
    }
    
    private func addLoanTime() {
        loanTimer += 1.1
    }
    
    private func addCustomer() {
        processedCustomer += 1
    }
    
    private func managerClear() {
        depositTimer = 0
        loanTimer = 0
        processedCustomer = 0
    }
}
