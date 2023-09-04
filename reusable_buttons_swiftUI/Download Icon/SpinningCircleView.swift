//
//  SpinningCircleView.swift
//  reusable_buttons_swiftUI
//
//  Created by Mac Pro on 04.09.2023.
//

import SwiftUI

struct SpinningCircleView: View {
    @State private var animateRotation = false
    @State private var animateStrokeStart = true
    @State private var animateStrokeEnd = true
    
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
            .trim(
                from: animateStrokeStart ? 0.2 : 0.1,
                to: animateStrokeEnd ? 0.2 : 0.5
            )
            .stroke(Color.downloadButtonDownloadingForeground, lineWidth: DownloadIconLayout.lineWidth)
            .frame(width: DownloadIconLayout.size, height: DownloadIconLayout.size)
            .rotationEffect(.degrees(animateRotation ? 360 : 0), anchor: .center)
            .onAppear {
                withAnimation(
                    Animation.linear(duration: 1)
                        .repeatForever(autoreverses: false)
                ) {
                    self.animateRotation.toggle()
                }
                
                withAnimation(
                    Animation.linear(duration: 1)
                        .delay(0.5)
                        .repeatForever(autoreverses: true)
                ) {
                    self.animateStrokeStart.toggle()
                }
                
                withAnimation(
                    Animation.linear(duration: 1)
                        .delay(1)
                        .repeatForever(autoreverses: true)
                ) {
                    self.animateStrokeEnd.toggle()
                }
            }
    }
}

struct SpinningCircleView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            spinners.colorScheme(.dark)
            spinners.colorScheme(.light)
        }
    }
    
    static var spinners: some View {
        SpinningCircleView()
            .padding()
            .background(Color.backgroundColor)
    }
}
