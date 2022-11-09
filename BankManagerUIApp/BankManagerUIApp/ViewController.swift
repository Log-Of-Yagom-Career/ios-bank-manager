//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let waitingBackgroundColor = UIColor(red: 53/255, green: 199/255, blue: 89/255, alpha: 1)
    let taskingBackgroundColor = UIColor(red: 88/255, green: 86/255, blue: 214/255, alpha: 1)
    
    let timerLabel = TimerLabel()
    let taskingStackView = TaskingStackview()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonStackView = topStackView()
        let customerAddButton = taskButton(title: "고객 10명 추가", textColor: .blue)
        let resetButton = taskButton(title: "초기화", textColor: .red)
        
        view.addSubview(buttonStackView)
        addTopStackview(stackview: buttonStackView,headButton: customerAddButton, tailButton: resetButton)
        
        view.addSubview(timerLabel)
        timerLableForTop(timerLabel: timerLabel, for: buttonStackView)
        
        taskingStackViewConfigure()
        taskingStackView.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 15).isActive = true
       
        customerAddButton.addTarget(self, action: #selector(customerClick), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetClick), for: .touchUpInside)
    }
    
    private func addTopStackview(stackview: UIStackView, headButton: UIButton, tailButton: UIButton) {
        stackview.addArrangedSubview(headButton)
        stackview.addArrangedSubview(tailButton)
        
        stackview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        stackview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        headButton.widthAnchor.constraint(equalTo: tailButton.widthAnchor).isActive = true
    }
    
    private func taskButton(title: String, textColor: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .caption1)
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }
    
    private func topStackView() -> UIStackView {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.distribution = .fill
        stackview.alignment = .center
        
        return stackview
    }
    
    private func timerLableForTop(timerLabel: UILabel,for topAnchor: UIView) {
        timerLabel.topAnchor.constraint(equalTo: topAnchor.bottomAnchor, constant: 15).isActive = true
        timerLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        timerLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func taskingStackViewConfigure() {
        view.addSubview(taskingStackView)
        
        taskingStackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        taskingStackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    @objc func customerClick() {
        print("고객 10명 추가")
    }
    
    @objc func resetClick() {
        print("초기화")
    }
}

