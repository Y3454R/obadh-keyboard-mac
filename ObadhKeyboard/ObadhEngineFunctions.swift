//
//  ObadhEngineFunctions.swift
//  ObadhKeyboard
//
//  Created by yeasar on 1/8/25.
//

@_silgen_name("obadh_engine_enable")
func obadh_engine_enable()

@_silgen_name("obadh_engine_disable")
func obadh_engine_disable()

@_silgen_name("transliterate")
func transliterate(_ input: UnsafePointer<CChar>) -> UnsafeMutablePointer<
    CChar
>?

@_silgen_name("free_string")
func free_string(_ ptr: UnsafeMutablePointer<CChar>?)
