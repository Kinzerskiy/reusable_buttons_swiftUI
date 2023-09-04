//
//  MainButtonView.swift
//  reusable_buttons_swiftUI
//
//  Created by Mac Pro on 04.09.2023.
//

import SwiftUI

enum MainButtonType {
    case primary(withArrow: Bool)
    case secondary(withArrow: Bool)
    case destructive(withArrow: Bool)
    
    var hasArrow: Bool {
        switch self {
        case .primary(let hasArrow),
                .secondary(let hasArrow),
                .destructive(let hasArrow):
            return hasArrow
        }
    }
    
    var color: Color {
        switch self {
        case .primary:
            return .primaryButtonBackground
        case .secondary:
            return .secondaryButtonBackground
        case .destructive:
            return .destructiveButtonBackground
        }
    }
}

struct MainButtonView: View {
    private struct SizeKey: PreferenceKey {
        static func reduce(value: inout CGSize?, nextValue: () -> CGSize?) {
            value = value ?? nextValue()
        }
    }
    
    var title: String
    var type: MainButtonType
    var callback: () -> Void
    @State private var height: CGFloat?
    
    var body: some View {
        Button(action: { self.callback() }) {
            ZStack(alignment: .center) {
                HStack {
                    Spacer()
                    
                    Text(title)
                        .font(.uiButtonLabel)
                        .foregroundColor(.buttonText)
                        .padding(15)
                        .background(
                            GeometryReader { proxy in
                                Color.clear.preference(key: SizeKey.self, value: proxy.size)
                            }
                        )
                    
                    Spacer()
                }
                
                if type.hasArrow {
                    HStack {
                        Spacer()
                        
                        Image(systemName: "arrow.right")
                            .font(Font.system(size: 14, weight: .bold))
                            .foregroundColor(type.color)
                            .frame(width: height, height: height)
                            .background(
                                Color.white
                                    .cornerRadius(9)
                                    .padding(12)
                            )
                    }
                }
            }
        }
        .frame(height: height)
        .background(
            RoundedRectangle(cornerRadius: 9)
                .fill(type.color)
        )
        .onPreferenceChange(SizeKey.self) { size in
            self.height = size?.height
        }
    }
}

struct MainButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            buttons.colorScheme(.light)
            buttons.colorScheme(.dark)
        }
    }
    
    static var buttons: some View {
        VStack(spacing: 20) {
            MainButtonView(title: "Got it!", type: .primary(withArrow: false)) {
                print("Got it!")
            }
            MainButtonView(title: "Explore Tutorials", type: .primary(withArrow: true)) {
                print("Explore Tutorials")
            }
            MainButtonView(title: "Clear All", type: .secondary(withArrow: false)) {
                print("Clear All")
            }
            MainButtonView(title: "Clear All", type: .secondary(withArrow: true)) {
                print("Clear All")
            }
            MainButtonView(title: "Cancel", type: .destructive(withArrow: false)) {
                print("Cancel")
            }
            MainButtonView(title: "Sign Out", type: .destructive(withArrow: true)) {
                print("Sign Out")
            }
        }
        .padding(20)
        .background(Color.backgroundColor)
        .previewLayout(.sizeThatFits)
    }
}
