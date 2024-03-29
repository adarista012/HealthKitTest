//
//  TodayStepView.swift
//  TestOfHealthKit
//
//  Created by antonio dante arista rivas on 3/29/24.
//

import SwiftUI

struct TodayStepView: View {
    
    let step: Step
    
    var body: some View {
        VStack {
            Text("\(step.count)")
                .font(.largeTitle)
        }.frame(maxWidth: .infinity, maxHeight: 150)
            .background(.orange)
            .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
            .overlay(alignment: .topLeading) {
                HStack {
                    Image(systemName: "flame")
                        .foregroundStyle(.red)
                    Text("Steps")
                }.padding()
            }
            .overlay(alignment: .bottomTrailing) {
                Text(step.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .padding()
            }
    }
}

#Preview {
    TodayStepView(step: Step(count: 8001, date: Date.now))
}
