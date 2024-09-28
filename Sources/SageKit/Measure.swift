//
//  Measure.swift
//  BenKit
//
//  Created by Benjamin Sage on 9/20/24.
//

import SwiftUI

private struct MeasureModifier: ViewModifier {
    var attribute: MeasurementProperty
    var updating: Bool
    var binding: Binding<CGFloat>

    func body(content: Content) -> some View {
        content
            .background {
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            update(with: proxy)
                        }
                        .onChange(of: proxy.size) { _ in
                            if updating {
                                update(with: proxy)
                            }
                        }
                }
            }
    }

    func update(with proxy: GeometryProxy) {
        binding.wrappedValue = attribute.value(from: proxy)
    }
}

public enum MeasurementProperty {
    case width
    case height

    func value(from proxy: GeometryProxy) -> CGFloat {
        switch self {
        case .width:
            proxy.size.width
        case .height:
            proxy.size.height
        }
    }
}

extension View {
    public func measure(
        _ attribute: MeasurementProperty, updating: Bool = true, _ binding: Binding<CGFloat>
    ) -> some View {
        self
            .modifier(MeasureModifier(attribute: attribute, updating: updating, binding: binding))
    }
}
