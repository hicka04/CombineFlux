//
//  Store.swift
//  
//
//  Created by hicka04 on 2020/02/17.
//

import Foundation

public protocol State {
    
    associatedtype Action: CombineFlux.Action
    
    init()
    
    mutating func update(from action: Action)
}

open class Store<State: CombineFlux.State>: ObservableObject {
    
    @Published public var state: State = .init()
    
    public convenience init() {
        self.init(dispatcher: .shared)
    }
    
    init(dispatcher: Dispatcher<State.Action>) {
        dispatcher.register { [weak self] action in
            self?.state.update(from: action)
        }
    }
}
