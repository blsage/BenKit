//
//  Sleep.swift
//  BenKit
//
//  Created by Benjamin Sage on 9/20/24.
//

import Foundation

public func sleep(_ seconds: Double) async {
    try? await Task.sleep(for: .seconds(seconds))
}
