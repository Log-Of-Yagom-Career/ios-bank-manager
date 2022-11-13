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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
    
    @objc private func resetClick() {
        print("초기화")
    }
}

