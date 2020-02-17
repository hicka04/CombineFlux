//
//  SampleView.swift
//  
//
//  Created by hicka04 on 2020/02/17.
//

import Foundation
import SwiftUI

struct SampleView: View {
    
    @ObservedObject private var store: SampleStore = .init()
    private let actionCreator = SampleActionCreator()
    
    var body: some View {
        List(store.state.items, id: \.id) { item in
            Text("\(item.id)")
        }.onAppear {
            self.actionCreator.onAppear()
        }
    }
}
