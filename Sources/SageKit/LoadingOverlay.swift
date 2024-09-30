//
//  LoadingOverlay.swift
//  SageKit
//
//  Created by Benjamin Sage on 9/29/24.
//

import SwiftUI

public struct LoadingOverlay: ViewModifier {
    public var amount: Int
    public var done: Bool

    var degrees: Double {
        done ? 360 : Double(amount) / 100 * 360
    }

    var padding: Double {
        done ? -0.25 : 0.25
    }

    public func body(content: Content) -> some View {
        content
            .overlay {
                Color.black.opacity(0.5)
                    .mask {
                        PieSlice(
                            startAngle: .degrees(-90),
                            endAngle: .degrees(Double(-90 + degrees)),
                            padding: padding
                        )
                        .fill(style: FillStyle(eoFill: true))
                    }

            }
            .animation(.spring, value: degrees)
            .animation(.spring, value: padding)
    }
}


extension View {
    public func loadingOverlay(_ amount: Int, done: Bool) -> some View {
        modifier(LoadingOverlay(amount: amount, done: done))
    }
}

// MARK: Preview

#Preview {
    Color.red
        .frame(width: 100, height: 100)
        .loadingOverlay(40, done: true)
}
