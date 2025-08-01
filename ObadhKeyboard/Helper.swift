//
//  Helper.swift
//  ObadhKeyboard
//
//  Created by yeasar on 1/8/25.
//

import Foundation

func transliterateText(_ text: String) -> String? {
    guard let cString = text.cString(using: .utf8) else { return nil }

    guard let outputPtr = transliterate(cString) else {
        return nil
    }

    let output = String(cString: outputPtr)
    free_string(outputPtr)
    return output
}
