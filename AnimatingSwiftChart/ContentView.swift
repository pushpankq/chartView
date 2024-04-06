//
//  ContentView.swift
//  AnimatingSwiftChart
//
//  Created by Pushpank Kumar on 06/04/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    @State private var appDownloads: [Download] = sampleDownload
    @State private var isAnimated: Bool = false
    @State private var trigger: Bool = false
    @State private var chartType: ChartType = .bar
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Chart Type") {
                    Picker("", selection: $chartType) {
                        ForEach(ChartType.allCases, id: \.self) {
                            Text($0.id)
                        }
                    }.pickerStyle(.segmented)
                }
                Section("Chart") {
                    switch chartType {
                    case .bar:
                        BarChartView(appDownloads: $appDownloads)
                            .onAppear(perform: {
                                trigger.toggle()
                            })
                    case .line:
                        LineChartView(appDownloads: $appDownloads)
                            .onAppear(perform: {
                                trigger.toggle()
                            })
                    case .pie:
                        PieChartView(appDownloads: $appDownloads)
                            .onAppear(perform: {
                                trigger.toggle()
                            })
                    }
                }
            }
            .navigationTitle("Animated Charts")
            .onChange(of: trigger) { oldValue, newValue in
                resetChartAnimation()
                animateChart()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Trigger") {
                        trigger.toggle()
                    }
                }
            }
        }
    }
    
    private func animateChart() {
        guard !isAnimated else { return }
        isAnimated = true
        
        $appDownloads.enumerated().forEach { (index, element) in
            let delay = Double(index) * 0.05
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation(.smooth) {
                    element.wrappedValue.isAnimated = true
                }
            }
        }
    }
    
    private func resetChartAnimation() {
        $appDownloads.forEach { download in
            download.wrappedValue.isAnimated =  false
        }
        isAnimated = false
    }
}

#Preview {
    ContentView()
}

