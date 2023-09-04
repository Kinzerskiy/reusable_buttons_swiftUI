//
//  DownloadProgressDisplayable.swift
//  reusable_buttons_swiftUI
//
//  Created by Mac Pro on 04.09.2023.
//



import Foundation
import SwiftUI

enum DownloadProgressDisplayable: CustomStringConvertible {
    case notDownloadable
    case downloadable
    case enqueued
    case inProgress(progress: Double)
    case downloaded
    
    var description: String {
        switch self {
        case .notDownloadable:
            return "notDownloadable"
        case .downloadable:
            return "downloadable"
        case .enqueued:
            return "enqueued"
        case .inProgress(progress: let progress):
            return "inProgress(\(progress))"
        case .downloaded:
            return "downloaded"
        }
    }
    
    var accessibilityDescription: String {
        switch self {
        case .notDownloadable:
            return "Reset download"
        case .downloadable:
            return "Download"
        case .enqueued, .inProgress:
            return "Cancel download"
        case .downloaded:
            return "Delete download"
        }
    }
}


struct MockDownloadIcon: View {
    @State private var icon: DownloadIcon = DownloadIcon(downloadProgress: .notDownloadable)
    @State private var counter = 0
    
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    var body: some View {
        icon
            .onTapGesture {
                switch self.icon.downloadProgress {
                case .notDownloadable:
                    self.icon = DownloadIcon(downloadProgress: .downloadable)
                case .downloadable:
                    self.icon = DownloadIcon(downloadProgress: .enqueued)
                case .downloaded:
                    self.icon = DownloadIcon(downloadProgress: .notDownloadable)
                default:
                    break
                }
            }
            .onReceive(timer) { _ in
                switch self.icon.downloadProgress {
                case .enqueued:
                    if self.counter > 4 {
                        self.icon = DownloadIcon(downloadProgress: .inProgress(progress: 0.0))
                    }
                    self.counter += 1
                case .inProgress(progress: let progress):
                    switch progress {
                    case 0.0:
                        self.icon = DownloadIcon(downloadProgress: .inProgress(progress: 0.2))
                    case 0.2:
                        self.icon = DownloadIcon(downloadProgress: .inProgress(progress: 0.6))
                    case 0.6:
                        self.icon = DownloadIcon(downloadProgress: .inProgress(progress: 0.8))
                    default:
                        self.icon = DownloadIcon(downloadProgress: .downloaded)
                        self.counter = 0
                    }
                default:
                    break
                }
            }
    }
}

