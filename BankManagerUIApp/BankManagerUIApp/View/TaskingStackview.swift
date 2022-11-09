//
//  TaskingStackview.swift
//  BankManagerUIApp
//
//  Created by Baem on 2022/11/10.
//

import UIKit

class TaskingStackview: UIStackView {
    let waitingBackgroundColor = UIColor(red: 53/255, green: 199/255, blue: 89/255, alpha: 1)
    let taskingBackgroundColor = UIColor(red: 88/255, green: 86/255, blue: 214/255, alpha: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
        let waitingLabel = taskLabel(title: "대기중", backgroundColor: waitingBackgroundColor)
        let taskingLabel = taskLabel(title: "업무중", backgroundColor: taskingBackgroundColor)
        
        self.addArrangedSubview(waitingLabel)
        self.addArrangedSubview(taskingLabel)
        
        waitingLabel.widthAnchor.constraint(equalTo: taskingLabel.widthAnchor).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureStackView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.alignment = .center
        self.distribution = .fill
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
}
