// NCCSerialized.swift
// Copyright (C) 2019-2020 Nuclear Cyborg Corp
//
// db@nuclearcyborg.com

import Foundation

@propertyWrapper public struct NCCSerialized<Wrapped> {
    private let queue = DispatchQueue(label: "DispatchQueueLocked\(UUID().uuidString)")

    private var _wrappedValue: Wrapped
    public var wrappedValue: Wrapped {
        get {
            Thread.onMain {
                return queue.sync { _wrappedValue }
            }
        }
        set {
            Thread.onMain {
                queue.sync { _wrappedValue = newValue }
            }
        }
    }

    public init(wrappedValue: Wrapped) {
        self.wrappedValue = wrappedValue
    }
}
