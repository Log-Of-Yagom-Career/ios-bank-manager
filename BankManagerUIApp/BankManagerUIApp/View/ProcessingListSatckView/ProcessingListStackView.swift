//
//  ProcessingListStackView.swift
//  BankManagerUIApp
//
//  Created by Baem on 2022/11/12.
//

import UIKit

class ProcessingListStackView: UIStackView {
    let waitingListView = CustomCustomerListView()
    let taskingListView = CustomCustomerListView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
        
        self.addArrangedSubview(waitingListView)
        self.addArrangedSubview(taskingListView)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureStackView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.alignment = .fill
    }
}
