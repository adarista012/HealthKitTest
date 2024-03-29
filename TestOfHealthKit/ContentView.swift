//
//  ContentView.swift
//  TestOfHealthKit
//
//  Created by antonio dante arista rivas on 3/28/24.
//

import SwiftUI

enum DisplayType: Int, Identifiable, CaseIterable {
    
    case list
    case chart
    
    var id: Int {
        rawValue
    }
}

extension DisplayType {
    
    var icon: String {
        switch self {
            case .list:
                return "list.bullet"
            case .chart:
                return "chart.bar"
        }
    }
}

struct ContentView: View {
    
    @State private var healthStore = HealthStore()
    @State private var displayType: DisplayType = .list
    
    private var steps: [Step] {
        healthStore.steps.sorted { lhs, rhs in
            lhs.date > rhs.date
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Lab Me").foregroundStyle(.orange).font(.largeTitle).fontWeight(.bold)
            if let step = steps.first {
                TodayStepView(step: step)
                
            }
            
            Picker("Selection", selection: $displayType) {
                ForEach(DisplayType.allCases) { displayType in
                    Image(systemName: displayType.icon).tag(displayType)
                    
                }
            }
            .pickerStyle(.segmented)
            
            switch displayType {
                case .list:
                    StepListView(steps: Array(steps.dropFirst()))
                case .chart:
                    StepsChartView(steps: steps)
            }
            
            
        }
                .task {
                await healthStore.requestAuthorization()
                do {
                    try await healthStore.calculateSteps()
                } catch {
                    print(error)
                }
                }.padding()
                
        }
    }


#Preview {
    NavigationStack {
        ContentView()
    }
}
