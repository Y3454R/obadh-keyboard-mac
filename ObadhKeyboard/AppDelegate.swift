//
//  AppDelegate.swift
//  ObadhKeyboard
//
//  Created by yeasar on 1/8/25.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var isObadhEnabled = false  // Track toggle state

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create status bar item
        statusItem = NSStatusBar.system.statusItem(
            withLength: NSStatusItem.variableLength
        )

        if let button = statusItem?.button {
            button.title = "⌨️ Obadh"
        }

        constructMenu()
    }

    func constructMenu() {
        let menu = NSMenu()

        // Toggle item
        let toggleItem = NSMenuItem(
            title: "Enable Obadh Keyboard",
            action: #selector(toggleKeyboard),
            keyEquivalent: ""
        )
        toggleItem.target = self
        menu.addItem(toggleItem)

        // Quit item
        menu.addItem(NSMenuItem.separator())
        let quitItem = NSMenuItem(
            title: "Quit",
            action: #selector(quitApp),
            keyEquivalent: "q"
        )
        quitItem.target = self
        menu.addItem(quitItem)

        statusItem?.menu = menu
    }

    @objc func toggleKeyboard(_ sender: NSMenuItem) {
        isObadhEnabled.toggle()
        sender.title =
            isObadhEnabled ? "Disable Obadh Keyboard" : "Enable Obadh Keyboard"

        if isObadhEnabled {
            obadh_engine_enable()  // Call Rust enable
            // Test transliteration when enabled
            let sample = "ami banglay gan gai"
            if let bengali = transliterateText(sample) {
                print("Transliterated result: \(bengali)")
            }
        } else {
            obadh_engine_disable()  // Call Rust disable
        }

        print(
            "Obadh keyboard is now \(isObadhEnabled ? "enabled" : "disabled")"
        )
    }

    @objc func quitApp() {
        NSApp.terminate(nil)
    }
}
