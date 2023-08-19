//
//  State.swift
//  BankManagerUIApp
//
//  Created by Baem on 2022/11/13.
//

//enum State {
//    case stop
//    case progress
//}

struct State {
    static var now: State = .stop
    
    enum State {
        case stop
        case progress
    }
}
