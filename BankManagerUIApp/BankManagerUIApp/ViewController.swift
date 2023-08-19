//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let buttonStackView = TopButtonStackView()
    let timerLabel = TimerLabel()
    let taskingStackView = TaskingStackview()
    let processingListStackView = ProcessingListStackView()
    var taskTimer = Timer()
    var timerChecking: TimeInterval = 0
    var bank = Bank()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAutoLayout()
    }
    
    private func configureAutoLayout() {
        view.addSubview(buttonStackView)
        buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        buttonStackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        buttonStackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(timerLabel)
        timerLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 15).isActive = true
        timerLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        timerLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        taskingStackViewConfigure()
        buttonStackView.customerAddButton.addTarget(self, action: #selector(customerClick), for: .touchUpInside)
        buttonStackView.resetButton.addTarget(self, action: #selector(resetClick), for: .touchUpInside)
        
        view.addSubview(processingListStackView)
        
        processingListStackView.topAnchor.constraint(equalTo: taskingStackView.bottomAnchor).isActive = true
        processingListStackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        processingListStackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        processingListStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func taskingStackViewConfigure() {
        view.addSubview(taskingStackView)
        
        taskingStackView.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 15).isActive = true
        taskingStackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        taskingStackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    @objc private func customerClick() {
        print("고객 10명 추가")
        
        switch State.now {
        case .stop:
            timerLabel.text = "업무시간 - 0.00"
            timerChecking = 0.00
            taskTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            // 10명 대기열 추가
            
            for label in bank.openBank() {
                processingListStackView.waitingListView.customStackView.addArrangedSubview(label)
            }
            
            State.now = .progress
        case .progress:
            print("진행중 ...")
            // 10명 대기열 추가
        }
    }
    
    @objc private func resetClick() {
        taskTimer.invalidate()
        // 모든 대기열 삭제
        State.now = .stop
    }
    
    @objc private func timerAction() {
        timerChecking += 0.01
        
        let numberFMT = NumberFormatter()
        numberFMT.numberStyle = .decimal
        
        timerLabel.text = "업무시간 - " + (numberFMT.string(for: timerChecking) ?? "00:00:000")
    }
}

