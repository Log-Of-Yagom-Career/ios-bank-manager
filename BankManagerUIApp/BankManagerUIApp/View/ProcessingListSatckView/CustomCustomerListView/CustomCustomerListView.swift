//
//  CustomCustomerListView.swift
//  BankManagerUIApp

import UIKit

class CustomCustomerListView: UIView {
    let customScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    let customStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 5
        
        return stackView
    }()
    
    let listLabel = CustomerLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let scrollView = customScrollView
        self.addSubview(scrollView)
        
        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        let stackView = customStackView
        scrollView.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        let label1 = listLabel
        label1.text = "1 - 예금"
        
        stackView.addArrangedSubview(label1)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
