//
//  LineChartView.swift
//  AnimatingSwiftChart
//
//  Created by Pushpank Kumar on 07/04/24.
//

import SwiftUI
import Charts

struct LineChartView: View {
    @Binding var appDownloads: [Download]

    var body: some View {
        VStack {
            Chart {
                ForEach(appDownloads) { download in
                    LineMark(
                        x: .value("Month", download.month),
                        y: .value("Downloads",download.isAnimated ? download.value : 0)
                    )
                    .foregroundStyle(.red.gradient)
                    .opacity(download.isAnimated ? 1 : 0)
                }
            }
            .chartYScale(domain: 0...12000)
            .frame(height: 250)
            .padding()
            .background(.background, in: .rect(cornerRadius: 10))
            Spacer(minLength: 0 )
        }
    }
}
