//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonStackView = topStackView()
        let customerAddButton = taskButton(title: "고객 10명 추가", textColor: .blue)
        let resetButton = taskButton(title: "초기화", textColor: .red)
        
        view.addSubview(buttonStackView)
        addTopStackview(stackview: buttonStackView,headButton: customerAddButton, tailButton: resetButton)
        
        let timerLabel = timerLabel()
        view.addSubview(timerLabel)
        timerLableForTop(timerLabel: timerLabel, for: buttonStackView)
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
    
    private func timerLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "업무시간 - " + "00:00:000"
        label.font = .preferredFont(forTextStyle: .title2)
        label.textAlignment = .center
        
        return label
    }
    
    private func timerLableForTop(timerLabel: UILabel,for topAnchor: UIView) {
        timerLabel.topAnchor.constraint(equalTo: topAnchor.bottomAnchor, constant: 15).isActive = true
        timerLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        timerLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

