//
//  Published+Codable.swift
//  BenKit
//
//  Created by Benjamin Sage on 9/23/24.
//

import Combine
import Foundation

nonisolated(unsafe) private var cancellableSet: Set<AnyCancellable> = []

extension Published where Value: Codable {
    public init(wrappedValue defaultValue: Value, key: String) {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                let value = try JSONDecoder().decode(Value.self, from: data)
                self.init(initialValue: value)
            } catch {
                print("Error while deconding \(key)")
                self.init(initialValue: defaultValue)
            }
        } else {
            self.init(initialValue: defaultValue)
        }

        projectedValue
            .sink { val in
                do {
                    let data = try JSONEncoder().encode(val)
                    UserDefaults.standard.set(data, forKey: key)
                } catch {
                    print("Error while decoding \(key)")
                }
            }
            .store(in: &cancellableSet)
    }
}
