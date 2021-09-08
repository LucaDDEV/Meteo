//
//  Helper + Extension.swift
//  MeteoApp
//
//  Created by Luc on 30/08/21.
//

import Foundation
import SwiftUI

// MARK: Stato App
enum StatoApp {
    case cittaImpostata, cittaDaImpostare
}

// MARK: Data
extension Date {
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        dateformat.locale = Locale(identifier: "it")
        return dateformat.string(from: self)
    }
}


// MARK: Wind
enum Direction: String, CaseIterable {
    case n, nne, ne, ene, e, ese, se, sse, s, ssw, sw, wsw, w, wnw, nw, nnw
}

extension Direction: CustomStringConvertible  {
    init<D: BinaryFloatingPoint>(_ direction: D) {
        self =  Self.allCases[Int((direction.angle+11.25).truncatingRemainder(dividingBy: 360)/22.5)]
    }
    var description: String { rawValue.uppercased() }
}

extension BinaryFloatingPoint {
    var angle: Self {
        (truncatingRemainder(dividingBy: 360) + 360)
            .truncatingRemainder(dividingBy: 360)
    }
    var direction: Direction { .init(self) }
}
// MARK: End Wind

// MARK: Custom Modifier
extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 0.5).padding(.top, 35))
            .foregroundColor(.white)
            .padding(10)
    }
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
