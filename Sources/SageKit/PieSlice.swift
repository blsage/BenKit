//
//  PieSlice.swift
//  SageKit
//
//  Created by Benjamin Sage on 9/29/24.
//

import SwiftUI

struct PieSlice: Shape {
    var startAngle: Angle = .zero
    var endAngle: Angle
    var padding: CGFloat = .zero

    var animatableData: AnimatablePair<AnimatablePair<Double, Double>, CGFloat> {
        get {
            AnimatablePair(AnimatablePair(startAngle.radians, endAngle.radians), padding)
        }
        set {
            startAngle = .radians(newValue.first.first)
            endAngle = .radians(newValue.first.second)
            padding = newValue.second
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Rectangle().path(in: rect)
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let effectiveRadius = radius * ( 1 - padding * 2)

        path.move(to: center)
        path.addArc(center: center,
                    radius: effectiveRadius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: false)
        path.closeSubpath()



        return path
    }
}

#Preview {
    PieSlice(endAngle: .degrees(40))
        .fill(style: FillStyle(eoFill: true))
}
