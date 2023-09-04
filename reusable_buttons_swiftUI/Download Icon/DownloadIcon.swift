//
//  DownloadIcon.swift
//  reusable_buttons_swiftUI
//
//  Created by Mac Pro on 04.09.2023.
//

import SwiftUI

enum DownloadIconLayout {
    static let size: CGFloat = 20
    static let lineWidth: CGFloat = 2
}

struct DownloadIcon: View {
    let downloadProgress: DownloadProgressDisplayable
    
    var body: some View {
        icon.frame(width: DownloadIconLayout.size, height: DownloadIconLayout.size)
    }
    
    var icon: some View {
        switch downloadProgress {
        case .notDownloadable:
            return AnyView(DownloadWarningView())
        case .downloadable:
            return AnyView(ArrowInCircleView(fillColour: .downloadButtonNotDownloaded))
        case .enqueued:
            return AnyView(SpinningCircleView())
        case .inProgress(progress: let progress):
            return AnyView(CircularProgressBar(progress: progress))
        case .downloaded:
            return AnyView(ArrowInCircleView(fillColour: .downloadButtonDownloaded))
        }
    }
}


struct DownloadIcon_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            selectionList.colorScheme(.light)
            selectionList.colorScheme(.dark)
        }
    }
    
    static var selectionList: some View {
        VStack(alignment: .trailing) {
            MockDownloadIcon()
            icon(for: .downloadable)
            icon(for: .enqueued)
            icon(for: .inProgress(progress: 0.3))
            icon(for: .downloaded)
            icon(for: .notDownloadable)
        }
        .padding(20)
        .background(Color.backgroundColor)
        .previewLayout(.sizeThatFits)
    }
    
    static func icon(for state: DownloadProgressDisplayable) -> some View {
        HStack {
            Text(state.description)
            DownloadIcon(downloadProgress: state)
        }
    }
}
