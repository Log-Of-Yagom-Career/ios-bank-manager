//
//  CustomerLabel.swift
//  BankManagerUIApp
//
//  Created by Baem on 2022/11/13.
//

import UIKit

class CustomerLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = .preferredFont(forTextStyle: .title2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
