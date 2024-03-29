//
//  StepListView.swift
//  TestOfHealthKit
//
//  Created by antonio dante arista rivas on 3/29/24.
//

import SwiftUI

struct StepListView: View {
    
    let steps: [Step]
    
    var body: some View {
        List(steps) { step in
            HStack {
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(isUnder8000(step.count) ? .red: .green)
                Text("\(step.count)")
                Spacer()
                Text(step.date.formatted(date: .abbreviated, time: .omitted))
                
            }
        }.listStyle(.plain)
    }
}

#Preview {
    StepListView(steps: [])
}
