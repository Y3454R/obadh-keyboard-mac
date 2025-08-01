//
//  ObadhKeyboardApp.swift
//  ObadhKeyboard
//
//  Created by yeasar on 1/8/25.
//

import SwiftUI

@main
struct ObadhKeyboardApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            EmptyView()  // macOS menu bar settings entry (can leave empty)
        }
    }
}
