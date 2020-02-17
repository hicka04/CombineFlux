//
//  SampleAction.swift
//  
//
//  Created by hicka04 on 2020/02/17.
//

import Foundation
import CombineFlux

enum SampleAction: Action {
    
    case updateItems(_ samples: [SampleItem])
}
