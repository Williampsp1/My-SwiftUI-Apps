//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by William Lopez on 1/26/23.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
