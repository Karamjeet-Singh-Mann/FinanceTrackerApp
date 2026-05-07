//
//  DIContainer+Environment.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 30/04/26.
//

import SwiftUI

private struct DIContainerKey: EnvironmentKey {
    static let defaultValue = DIContainer()
}

extension EnvironmentValues {
    var container: DIContainer {
        get { self[DIContainerKey.self] }
        set { self[DIContainerKey.self] = newValue }
    }
}
