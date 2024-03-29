//
//  StepsChartView.swift
//  TestOfHealthKit
//
//  Created by antonio dante arista rivas on 3/29/24.
//

import SwiftUI
import Charts

struct StepsChartView: View {
    
    let steps: [Step]
    var body: some View {
        Chart {
            ForEach(steps) { step in
                BarMark(x: .value("Date", step.date), y: .value("Count", step.count)).foregroundStyle(isUnder8000(step.count) ? .red : .green)
            }
        }
    }
}

#Preview {
    StepsChartView(steps: [Step(count: 1234, date: Date.now), Step(count: 8200, date: Date.now.addingTimeInterval(-24 * 3600)), Step(count: 222, date: Date.now.addingTimeInterval(-48 * 3600)) ]
    )
}
