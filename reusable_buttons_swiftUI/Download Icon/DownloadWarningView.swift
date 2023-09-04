//
//  DownloadWarningView.swift
//  reusable_buttons_swiftUI
//
//  Created by Mac Pro on 04.09.2023.
//

import SwiftUI

struct DownloadWarningView: View {
    var body: some View {
        Image(systemName: "exclamationmark.triangle.fill")
            .resizable()
            .font(Font.title.weight(.bold))
            .foregroundColor(Color.downloadButtonWarning)
            .frame(width: DownloadIconLayout.size, height: DownloadIconLayout.size)
    }
}


struct DownloadWarningView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            icon.colorScheme(.dark)
            icon.colorScheme(.light)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
    
    static var icon: some View {
        DownloadWarningView()
            .padding()
            .background(Color.backgroundColor)
    }
}
