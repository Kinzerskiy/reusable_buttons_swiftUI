//
//  CircleProgressBar.swift
//  reusable_buttons_swiftUI
//
//  Created by Mac Pro on 04.09.2023.
//

import SwiftUI

struct CircularProgressBar: View {
    var progress: Double
    
    var body: some View {
        ZStack {
            background
            circleOverlay
        }
    }
    
    var background: some View {
        ZStack(alignment: .center) {
            Circle()
                .stroke(Color.downloadButtonDownloadingBackground, lineWidth: DownloadIconLayout.lineWidth)
                .frame(width: DownloadIconLayout.size, height: DownloadIconLayout.size)
            
            RoundedRectangle(cornerRadius:  1)
                .fill(Color.downloadButtonDownloadingForeground)
                .frame(width: 6, height: 6)
        }
    }
    
    var circleOverlay: some View {
        Circle()
            .trim(from: 0.0, to: CGFloat(progress))
            .stroke(Color.downloadButtonDownloadingForeground, lineWidth: DownloadIconLayout.lineWidth)
            .frame(width: DownloadIconLayout.size, height: DownloadIconLayout.size)
            .rotationEffect(.degrees(-90), anchor: .center)
    }
}


struct CircleProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            progressViews.colorScheme(.dark)
            progressViews.colorScheme(.light)
        }
    }
    
    static var progressViews: some View {
        HStack(spacing: 20) {
            CircularProgressBar(progress: 0)
            CircularProgressBar(progress: 0.2)
            CircularProgressBar(progress: 0.4)
            CircularProgressBar(progress: 0.6)
            CircularProgressBar(progress: 0.9)
            CircularProgressBar(progress: 1)
        }.padding(20)
            .background(Color.backgroundColor)
            .previewLayout(.sizeThatFits)
    }
}
