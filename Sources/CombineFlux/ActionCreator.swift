//
//  ActionCreator.swift
//  
//
//  Created by hicka04 on 2020/02/17.
//

import Foundation

public protocol ActionCreator {
    
    associatedtype Action: CombineFlux.Action
    associatedtype Dependency
    
    init(_ dependency: Dependency)
}

public extension ActionCreator {
    
    var dispatcher: Dispatcher<Action> {
        .shared
    }
}

public extension ActionCreator where Dependency == Void {
    
    init() {
        self.init(())
    }
}
