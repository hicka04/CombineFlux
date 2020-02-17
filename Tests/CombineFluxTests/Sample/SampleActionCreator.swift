//
//  SampleActionCreator.swift
//  
//
//  Created by hicka04 on 2020/02/17.
//

import Foundation
import Combine
import CombineFlux

class SampleActionCreator: ActionCreator {
    
    typealias Action = SampleAction
    typealias Dependency = ()
    
    private var cancellables: Set<AnyCancellable> = []
    private let onAppearSubject = PassthroughSubject<Void, Never>()
    
    required init(_ dependency: Dependency) {
        onAppearSubject
            .map { [SampleItem]() }
            .sink { [weak self] items in
                self?.dispatcher.dispatch(.updateItems(items))
            }.store(in: &cancellables)
    }
    
    func onAppear() {
        onAppearSubject.send()
    }
}
