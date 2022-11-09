//
//  CustomCustomerListView.swift
//  BankManagerUIApp

import UIKit

class CustomCustomerListView: UIView {
    var customScrollView: UIScrollView {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        
        return scrollView
    }
    
    var customStackView: UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 5
        
        return stackView
    }
    
    var listLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1 - 예금"
        label.font = .preferredFont(forTextStyle: .title2)
        
        return label
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
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
        let label2 = listLabel
        
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //        let waitingListView = CustomCustomerListView()
    //        let taskingListView = CustomCustomerListView()
    //
    //        view.addSubview(waitingListView)
    //        view.addSubview(taskingListView)
    //
    //        waitingListView.widthAnchor.constraint(equalTo: taskingListView.widthAnchor).isActive = true
    //        waitingListView.rightAnchor.constraint(equalTo: taskingListView.leftAnchor).isActive = true
    //
    //        waitingListView.topAnchor.constraint(equalTo: taskingStackview.bottomAnchor).isActive = true
    //        waitingListView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    //        waitingListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    //
    //        taskingListView.topAnchor.constraint(equalTo: taskingStackview.bottomAnchor).isActive = true
    //        taskingListView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    //        taskingListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
}
