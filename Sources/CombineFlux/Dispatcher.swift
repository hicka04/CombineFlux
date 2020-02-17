//
//  Dispatcher.swift
//  
//
//  Created by hicka04 on 2020/02/17.
//

import Foundation
import Combine

private var dispatchers: [ObjectIdentifier: Any] = [:]

public class Dispatcher<Action: CombineFlux.Action> {
    
    static var shared: Dispatcher<Action> {
        let id = ObjectIdentifier(Action.self)
        guard let shared = dispatchers[id] as? Dispatcher<Action> else {
            let dispatcher = Dispatcher<Action>()
            dispatchers[id] = dispatcher
            return dispatcher
        }
        
        return shared
    }
    
    private let actionSubject = PassthroughSubject<Action, Never>()
    private var cancellables: Set<AnyCancellable> = []
    
    private init() {}
    
    func register(_ callback: @escaping (Action) -> Void) {
        actionSubject
            .sink(receiveValue: callback)
            .store(in: &cancellables)
        
    }
    
    public func dispatch(_ action: Action) {
        actionSubject.send(action)
    }
}
