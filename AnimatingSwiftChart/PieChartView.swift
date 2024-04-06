//
//  PieChartView.swift
//  AnimatingSwiftChart
//
//  Created by Pushpank Kumar on 07/04/24.
//

import SwiftUI
import Charts

struct PieChartView: View {
    @Binding var appDownloads: [Download]

    var body: some View {
        VStack {
            Chart {
                ForEach(appDownloads) { download in
                    SectorMark(angle: .value("Downloads",download.isAnimated ? download.value : 0))
                        .foregroundStyle(by: .value("Month", download.month))
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
