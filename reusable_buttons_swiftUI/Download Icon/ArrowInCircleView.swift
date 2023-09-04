//
//  ArrowInCircleView.swift
//  reusable_buttons_swiftUI
//
//  Created by Mac Pro on 04.09.2023.
//

import SwiftUI

struct ArrowInCircleView: View {
    let fillColour: Color
    
    var body: some View {
        Image.download
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: DownloadIconLayout.size)
            .foregroundColor(fillColour)
    }
}


struct ArrowInCircleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            circles.colorScheme(.dark)
            circles.colorScheme(.light)
        }
    }
    
    static var circles: some View {
        HStack(spacing: 20) {
            ArrowInCircleView(fillColour: .accent)
            ArrowInCircleView(fillColour: .activeIcon)
        }
        .padding()
        .background(Color.backgroundColor)
        .previewLayout(.sizeThatFits)
    }
}
