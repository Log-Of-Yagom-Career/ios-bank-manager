//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let waitingBackgroundColor = UIColor(red: 53/255, green: 199/255, blue: 89/255, alpha: 1)
    let taskingBackgroundColor = UIColor(red: 88/255, green: 86/255, blue: 214/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonStackView = topStackView()
        let customerAddButton = taskButton(title: "고객 10명 추가", textColor: .blue)
        let resetButton = taskButton(title: "초기화", textColor: .red)
        let timerLabel = timerLabel()
        let taskingStackview = taskLabelStackview()
        let waitingLabel = taskLabel(title: "대기중", backgroundColor: waitingBackgroundColor)
        let taskingLabel = taskLabel(title: "업무중", backgroundColor: taskingBackgroundColor)
        
        view.addSubview(buttonStackView)
        addTopStackview(stackview: buttonStackView,headButton: customerAddButton, tailButton: resetButton)
        
        view.addSubview(timerLabel)
        timerLableForTop(timerLabel: timerLabel, for: buttonStackView)
        
        view.addSubview(taskingStackview)
        taskingStackview.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 15).isActive = true
        taskingStackview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        taskingStackview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        taskingStackview.addArrangedSubview(waitingLabel)
        taskingStackview.addArrangedSubview(taskingLabel)
        waitingLabel.widthAnchor.constraint(equalTo: taskingLabel.widthAnchor).isActive = true
        
        customerAddButton.addTarget(self, action: #selector(customerClick), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetClick), for: .touchUpInside)
        
        let waitingListView = CustomCustomerListView()
        let taskingListView = CustomCustomerListView()
        
        view.addSubview(waitingListView)
        view.addSubview(taskingListView)
        
        waitingListView.widthAnchor.constraint(equalTo: taskingListView.widthAnchor).isActive = true
        waitingListView.rightAnchor.constraint(equalTo: taskingListView.leftAnchor).isActive = true
        
        waitingListView.topAnchor.constraint(equalTo: taskingStackview.bottomAnchor).isActive = true
        waitingListView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        waitingListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        taskingListView.topAnchor.constraint(equalTo: taskingStackview.bottomAnchor).isActive = true
        taskingListView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        taskingListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
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
    
    private func taskLabelStackview() -> UIStackView {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.distribution = .fill
        
        return stackview
    }
    
    private func taskLabel(title: String, backgroundColor: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = title
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title1)
        label.backgroundColor = backgroundColor
        
        return label
    }
    
    @objc func customerClick() {
        print("고객 10명 추가")
    }
    
    @objc func resetClick() {
        print("초기화")
    }
}

