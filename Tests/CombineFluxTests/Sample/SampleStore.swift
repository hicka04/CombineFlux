//
//  SampleStore.swift
//  
//
//  Created by hicka04 on 2020/02/17.
//

import Foundation
import CombineFlux

struct SampleState: State {
    
    var items: [SampleItem] = []
    
    mutating func update(from action: SampleAction) {
        switch action {
        case .updateItems(let items):
            self.items = items
        }
    }
}

class SampleStore: Store<SampleState> {}
