//
//  TimerLabel.swift
//  BankManagerUIApp
//
//  Created by baem on 2022/11/10.
//

import UIKit

class TimerLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = "업무시간 - " + "00:00:000"
        self.font = .preferredFont(forTextStyle: .title2)
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
