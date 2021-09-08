//
//  DividerCustom.swift
//  MeteoApp
//
//  Created by Luc on 30/08/21.
//

import SwiftUI

struct DividerCustom: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .frame(width: 300, height: 0.5, alignment: .center)
            .opacity(0.3)
    }
}

struct DividerCustom_Previews: PreviewProvider {
    static var previews: some View {
        DividerCustom()
    }
}
